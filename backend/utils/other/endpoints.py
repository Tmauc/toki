import json
import os
import time

from fastapi import Depends, Header, HTTPException, WebSocketException
from fastapi import Request
from firebase_admin import auth
from firebase_admin.auth import InvalidIdTokenError
import logging
import redis as redis_pkg

from database.redis_db import check_api_rate_limit, try_acquire_listen_lock
from utils.rate_limit_config import RATE_POLICIES

logger = logging.getLogger(__name__)


def get_user(uid: str):
    user = auth.get_user(uid)
    return user


def verify_token(token: str) -> str:
    """
    Verify a Firebase token or ADMIN_KEY and return the uid.

    Args:
        token: The token to verify (Firebase ID token or ADMIN_KEY format)

    Returns:
        The user's uid

    Raises:
        InvalidIdTokenError: If the token is invalid
    """
    # Check for ADMIN_KEY format
    admin_key = os.getenv('ADMIN_KEY')
    if admin_key and token.startswith(admin_key):
        return token[len(admin_key) :]

    # Verify Firebase token
    try:
        decoded_token = auth.verify_id_token(token)
        return decoded_token['uid']
    except InvalidIdTokenError:
        if os.getenv('LOCAL_DEVELOPMENT') == 'true':
            return '123'
        raise


def get_current_user_uid(authorization: str = Header(None)):
    """FastAPI dependency for HTTP endpoints with Authorization header."""
    if not authorization:
        raise HTTPException(status_code=401, detail="Authorization header not found")
    elif len(str(authorization).split(' ')) != 2:
        raise HTTPException(status_code=401, detail="Invalid authorization token")

    try:
        token = authorization.split(' ')[1]
        return verify_token(token)
    except InvalidIdTokenError as e:
        logger.error(e)
        raise HTTPException(status_code=401, detail="Invalid authorization token")


def _verify_ws_auth(authorization: str) -> str:
    """Common WebSocket auth — verifies token, returns uid.

    Raises WebSocketException(code=1008) instead of HTTPException(401) so the
    ASGI server sends a proper WebSocket close frame (not a handshake crash).
    """
    if not authorization:
        raise WebSocketException(code=1008, reason="Authorization header not found")
    elif len(str(authorization).split(' ')) != 2:
        raise WebSocketException(code=1008, reason="Invalid authorization token")

    try:
        token = authorization.split(' ')[1]
        return verify_token(token)
    except InvalidIdTokenError as e:
        logger.error(f"WebSocket auth failed: {e}")
        raise WebSocketException(code=1008, reason="Invalid or expired token")
    except Exception as e:
        logger.error(f"WebSocket auth error: {e}")
        raise WebSocketException(code=1008, reason="Auth error")


def get_current_user_uid_ws_listen(authorization: str = Header(None)):
    """WebSocket auth for /v4/listen — NO rate limiting.

    Mobile apps reconnect legitimately on network switch / backgrounding,
    so the per-UID rate limiter must not block them.
    """
    return _verify_ws_auth(authorization)


def get_current_user_uid_ws(authorization: str = Header(None)):
    """WebSocket auth WITH per-UID rate limiting (7s window).

    Use for WebSocket endpoints that need retry-storm protection.
    """
    uid = _verify_ws_auth(authorization)

    # Fail-open on Redis errors to avoid reintroducing handshake crashes
    try:
        if not try_acquire_listen_lock(uid):
            logger.warning(f"WebSocket rate limited uid={uid}")
            raise WebSocketException(code=1008, reason="Rate limited, retry later")
    except WebSocketException:
        raise
    except Exception as e:
        logger.error(f"Rate limit check failed (allowing connection): {e}")

    return uid


def get_current_user_uid_from_ws_message(message: dict) -> str:
    """
    Get user uid from WebSocket first-message auth.

    Expected message format: {"type": "auth", "token": "<token>"}

    Returns:
        The user's uid

    Raises:
        ValueError: If message format is invalid
        InvalidIdTokenError: If token is invalid
    """
    if message.get("type") == "websocket.disconnect":
        raise ValueError("Client disconnected")

    text = message.get("text")
    if text is None:
        raise ValueError("Expected JSON auth message")

    try:
        auth_data = json.loads(text)
    except json.JSONDecodeError:
        raise ValueError("Invalid JSON")

    if auth_data.get("type") != "auth":
        raise ValueError("First message must be auth")

    token = auth_data.get("token")
    if not token:
        raise ValueError("Missing token")

    return verify_token(token)


def rate_limit_custom(endpoint: str, request: Request, requests_per_window: int, window_seconds: int):
    """Rate limit by client IP using Redis. Fail-open on Redis connection errors only."""
    ip = request.client.host
    try:
        allowed, remaining, reset = check_api_rate_limit(ip, endpoint, requests_per_window, window_seconds)
    except redis_pkg.exceptions.RedisError as e:
        logger.error(f"Rate limit Redis error (allowing request): {e}")
        return True

    if not allowed:
        raise HTTPException(
            status_code=429,
            detail="Too Many Requests",
            headers={
                "X-RateLimit-Limit": str(requests_per_window),
                "X-RateLimit-Remaining": "0",
                "X-RateLimit-Reset": str(reset),
                "Retry-After": str(reset),
            },
        )
    return True


def rate_limit_dependency(endpoint: str = "", requests_per_window: int = 60, window_seconds: int = 60):
    """Rate limit dependency for IP-based limiting (signin, phone_verify, etc.)."""

    def rate_limit(request: Request):
        return rate_limit_custom(endpoint, request, requests_per_window, window_seconds)

    return rate_limit


def with_rate_limit(auth_dependency, policy_name: str):
    """Wrap an auth dependency with per-UID rate limiting (config-driven).

    Looks up rate limit policy from RATE_POLICIES by name. Chains with an
    existing auth dependency that returns a UID. After auth succeeds, checks
    all rate limits against that UID.

    Fail mode is per-policy:
        fail_closed=False (default): allow request on Redis error (reads, low-cost)
        fail_closed=True: return 503 on Redis error (expensive endpoints)

    Args:
        auth_dependency: A FastAPI dependency that returns a UID string.
        policy_name: Key in RATE_POLICIES dict (utils/rate_limit_config.py).
    """
    policy = RATE_POLICIES[policy_name]
    limits = policy["limits"]
    fail_closed = policy.get("fail_closed", False)

    async def dependency(uid: str = Depends(auth_dependency)):
        try:
            for max_requests, window_seconds in limits:
                allowed, remaining, reset = check_api_rate_limit(
                    uid, f"{policy_name}:{window_seconds}s", max_requests, window_seconds
                )
                if not allowed:
                    raise HTTPException(
                        status_code=429,
                        detail=f"Rate limit exceeded. Maximum {max_requests} requests per {window_seconds}s.",
                        headers={
                            "X-RateLimit-Limit": str(max_requests),
                            "X-RateLimit-Remaining": "0",
                            "X-RateLimit-Reset": str(reset),
                            "Retry-After": str(reset),
                        },
                    )
        except HTTPException:
            raise
        except redis_pkg.exceptions.RedisError as e:
            if fail_closed:
                raise HTTPException(
                    status_code=503,
                    detail="Service temporarily unavailable",
                    headers={"Retry-After": "30"},
                )
            logger.error(f"Rate limit check failed (allowing request): {e}")
        return uid

    return dependency


def check_rate_limit_inline(key: str, policy_name: str):
    """Check rate limit inline (for endpoints with custom auth patterns).

    Use when auth is not a standard Depends() pattern (e.g., MCP, integration).
    Returns normally if allowed. Raises HTTPException(429) or HTTPException(503).

    Args:
        key: Rate limit key (uid, app_id:uid, etc.)
        policy_name: Key in RATE_POLICIES dict.
    """
    policy = RATE_POLICIES[policy_name]
    limits = policy["limits"]
    fail_closed = policy.get("fail_closed", False)

    try:
        for max_requests, window_seconds in limits:
            allowed, remaining, reset = check_api_rate_limit(
                key, f"{policy_name}:{window_seconds}s", max_requests, window_seconds
            )
            if not allowed:
                raise HTTPException(
                    status_code=429,
                    detail=f"Rate limit exceeded. Maximum {max_requests} requests per {window_seconds}s.",
                    headers={
                        "X-RateLimit-Limit": str(max_requests),
                        "X-RateLimit-Remaining": "0",
                        "X-RateLimit-Reset": str(reset),
                        "Retry-After": str(reset),
                    },
                )
    except HTTPException:
        raise
    except redis_pkg.exceptions.RedisError as e:
        if fail_closed:
            raise HTTPException(
                status_code=503,
                detail="Service temporarily unavailable",
                headers={"Retry-After": "30"},
            )
        logger.error(f"Rate limit check failed (allowing request): {e}")


def timeit(func):
    """
    Decorator for measuring function's running time.
    """

    def measure_time(*args, **kw):
        start_time = time.time()
        result = func(*args, **kw)
        logger.info("Processing time of %s(): %.2f seconds." % (func.__qualname__, time.time() - start_time))
        return result

    return measure_time


def delete_account(uid: str):
    auth.delete_user(uid)
    return {"message": "User deleted"}
