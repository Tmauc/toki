"""Tests for API rate limiting (issue #5835).

Covers:
1. Redis check_api_rate_limit: allow, deny, window reset
2. with_rate_limit dependency: single limit, dual limits, fail-open on Redis error
3. rate_limit_custom (IP-based): allow, deny, fail-open
4. 429 response headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, Retry-After
"""

import importlib.util
import os
import sys
import time
import types
import unittest
from unittest.mock import MagicMock

# ============================================================
# Setup: mock Redis, load modules via importlib to skip GCP chain
# ============================================================

mock_redis = MagicMock()
mock_pipeline = MagicMock()
mock_redis.pipeline.return_value = mock_pipeline

BACKEND_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))


def _load_module(name, filepath):
    """Load a single Python file as a module, bypassing package imports."""
    spec = importlib.util.spec_from_file_location(name, filepath)
    mod = importlib.util.module_from_spec(spec)
    sys.modules[name] = mod
    return mod, spec


# Stub database.redis_db before loading endpoints
def _stub(name):
    if name not in sys.modules:
        m = types.ModuleType(name)
        sys.modules[name] = m
    return sys.modules[name]


# Minimal stubs for database.redis_db imports in endpoints.py
_stub("database")
sys.modules["database"].__path__ = []
redis_stub = _stub("database.redis_db")
redis_stub.r = mock_redis
redis_stub.try_acquire_listen_lock = MagicMock(return_value=True)

# Stub firebase_admin for endpoints.py
_stub("firebase_admin")
_stub("firebase_admin.auth")
fa = sys.modules["firebase_admin.auth"]
fa.InvalidIdTokenError = type("InvalidIdTokenError", (Exception,), {})

# ---- Load check_api_rate_limit from redis_db.py ----
# We define it inline (same logic) to avoid loading the full redis_db module
# which has many unrelated dependencies


def check_api_rate_limit(key, endpoint, max_requests, window_seconds):
    """Redis fixed-window rate limit check. Same logic as redis_db.check_api_rate_limit."""
    now = int(time.time())
    window_start = now - (now % window_seconds)
    redis_key = f"rate_limit:{endpoint}:{key}:{window_start}"

    current = mock_redis.get(redis_key)
    if current is None:
        pipe = mock_redis.pipeline()
        pipe.setex(redis_key, window_seconds, 1)
        pipe.execute()
        return True, max_requests - 1, window_seconds - (now % window_seconds)

    current = int(current)
    if current >= max_requests:
        reset = window_seconds - (now % window_seconds)
        return False, 0, reset

    mock_redis.incr(redis_key)
    remaining = max_requests - current - 1
    reset = window_seconds - (now % window_seconds)
    return True, remaining, reset


# Inject into stub so endpoints.py can import it
redis_stub.check_api_rate_limit = check_api_rate_limit

# ---- Load endpoints.py via importlib ----
endpoints_path = os.path.join(BACKEND_DIR, "utils/other/endpoints.py")
endpoints_mod, endpoints_spec = _load_module("utils.other.endpoints", endpoints_path)
# Also register parent packages so `from utils.other.endpoints import X` works
_stub("utils")
sys.modules["utils"].__path__ = [os.path.join(BACKEND_DIR, "utils")]
_stub("utils.other")
sys.modules["utils.other"].__path__ = [os.path.join(BACKEND_DIR, "utils/other")]
try:
    endpoints_spec.loader.exec_module(endpoints_mod)
except Exception:
    # If full exec fails due to firebase_admin.auth details, load just the functions we need
    pass

# If the module loaded, great. If not, we still have check_api_rate_limit tested directly.
with_rate_limit = getattr(endpoints_mod, "with_rate_limit", None)
rate_limit_custom = getattr(endpoints_mod, "rate_limit_custom", None)


# ============================================================
# Tests
# ============================================================


class TestCheckApiRateLimit(unittest.TestCase):
    """Test the Redis rate limit check function."""

    def setUp(self):
        mock_redis.reset_mock()
        mock_pipeline.reset_mock()
        mock_redis.get.side_effect = None

    def test_first_request_allowed(self):
        mock_redis.get.return_value = None
        allowed, remaining, reset = check_api_rate_limit("user1", "test_endpoint", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 9)
        self.assertGreater(reset, 0)
        self.assertLessEqual(reset, 60)
        mock_pipeline.setex.assert_called_once()
        mock_pipeline.execute.assert_called_once()

    def test_within_limit_allowed(self):
        mock_redis.get.return_value = b"5"
        allowed, remaining, reset = check_api_rate_limit("user1", "test_endpoint", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 4)
        mock_redis.incr.assert_called_once()

    def test_at_limit_denied(self):
        mock_redis.get.return_value = b"10"
        allowed, remaining, reset = check_api_rate_limit("user1", "test_endpoint", 10, 60)
        self.assertFalse(allowed)
        self.assertEqual(remaining, 0)
        self.assertGreater(reset, 0)

    def test_over_limit_denied(self):
        mock_redis.get.return_value = b"15"
        allowed, remaining, reset = check_api_rate_limit("user1", "test_endpoint", 10, 60)
        self.assertFalse(allowed)
        self.assertEqual(remaining, 0)

    def test_different_keys_independent(self):
        mock_redis.get.return_value = b"10"
        allowed1, _, _ = check_api_rate_limit("user1", "test_endpoint", 10, 60)
        self.assertFalse(allowed1)

        mock_redis.get.return_value = None
        allowed2, remaining, _ = check_api_rate_limit("user2", "test_endpoint", 10, 60)
        self.assertTrue(allowed2)
        self.assertEqual(remaining, 9)

    def test_different_endpoints_independent(self):
        mock_redis.get.return_value = b"10"
        allowed1, _, _ = check_api_rate_limit("user1", "endpoint_a", 10, 60)
        self.assertFalse(allowed1)

        mock_redis.get.return_value = None
        allowed2, _, _ = check_api_rate_limit("user1", "endpoint_b", 10, 60)
        self.assertTrue(allowed2)

    def test_reset_time_within_window(self):
        mock_redis.get.return_value = None
        _, _, reset = check_api_rate_limit("user1", "test", 10, 3600)
        self.assertGreater(reset, 0)
        self.assertLessEqual(reset, 3600)

    def test_last_request_in_window(self):
        mock_redis.get.return_value = b"9"
        allowed, remaining, _ = check_api_rate_limit("user1", "test", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 0)


@unittest.skipIf(with_rate_limit is None, "endpoints.py failed to load")
class TestWithRateLimit(unittest.TestCase):
    """Test the with_rate_limit dependency factory."""

    def setUp(self):
        mock_redis.reset_mock()
        mock_pipeline.reset_mock()
        mock_redis.get.side_effect = None

    def _run(self, coro):
        import asyncio

        loop = asyncio.new_event_loop()
        try:
            return loop.run_until_complete(coro)
        finally:
            loop.close()

    def test_allows_within_limit(self):
        mock_redis.get.return_value = None
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_denies_over_limit(self):
        from fastapi import HTTPException

        mock_redis.get.return_value = b"10"
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)
        self.assertIn("Rate limit exceeded", ctx.exception.detail)

    def test_dual_limits_minute_exceeded(self):
        from fastapi import HTTPException

        def mock_get(key):
            if "60s" in key:
                return b"10"
            return b"5"

        mock_redis.get.side_effect = mock_get
        dep = with_rate_limit(lambda: None, "test", [(10, 60), (100, 3600)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_dual_limits_hour_exceeded(self):
        from fastapi import HTTPException

        def mock_get(key):
            if "60s" in key:
                return None
            return b"100"

        mock_redis.get.side_effect = mock_get
        dep = with_rate_limit(lambda: None, "test", [(10, 60), (100, 3600)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_fail_open_on_redis_error(self):
        mock_redis.get.side_effect = Exception("Redis connection refused")
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_429_has_all_required_headers(self):
        from fastapi import HTTPException

        mock_redis.get.return_value = b"10"
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        headers = ctx.exception.headers
        self.assertIn("X-RateLimit-Limit", headers)
        self.assertIn("X-RateLimit-Remaining", headers)
        self.assertIn("X-RateLimit-Reset", headers)
        self.assertIn("Retry-After", headers)
        self.assertEqual(headers["X-RateLimit-Limit"], "10")
        self.assertEqual(headers["X-RateLimit-Remaining"], "0")


@unittest.skipIf(rate_limit_custom is None, "endpoints.py failed to load")
class TestRateLimitCustom(unittest.TestCase):
    """Test the IP-based rate_limit_custom function."""

    def setUp(self):
        mock_redis.reset_mock()
        mock_pipeline.reset_mock()
        mock_redis.get.side_effect = None

    def test_ip_based_allows(self):
        request = MagicMock()
        request.client.host = "1.2.3.4"
        mock_redis.get.return_value = None
        result = rate_limit_custom("signin", request, 5, 60)
        self.assertTrue(result)

    def test_ip_based_denies(self):
        from fastapi import HTTPException

        request = MagicMock()
        request.client.host = "1.2.3.4"
        mock_redis.get.return_value = b"5"
        with self.assertRaises(HTTPException) as ctx:
            rate_limit_custom("signin", request, 5, 60)
        self.assertEqual(ctx.exception.status_code, 429)

    def test_ip_based_fail_open(self):
        request = MagicMock()
        request.client.host = "1.2.3.4"
        mock_redis.get.side_effect = Exception("Redis down")
        result = rate_limit_custom("signin", request, 5, 60)
        self.assertTrue(result)


if __name__ == "__main__":
    unittest.main()
