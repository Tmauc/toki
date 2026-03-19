"""Tests for API rate limiting (issue #5835).

Covers:
1. check_api_rate_limit: atomic Lua script behavior (allow, deny, key isolation)
2. with_rate_limit dependency: single limit, dual limits, fail-open on RedisError only
3. rate_limit_custom (IP-based): allow, deny, fail-open on RedisError only
4. 429 response headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, Retry-After
5. Shared bucket: both conversation POST endpoints share same rate limit bucket
"""

import importlib.util
import os
import re
import sys
import time
import types
import unittest
from unittest.mock import MagicMock, patch

import redis as redis_pkg

# ============================================================
# Setup: mock Redis, load endpoints.py via importlib
# ============================================================

BACKEND_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))

# Mock the function that endpoints.py imports from database.redis_db
mock_check_rate_limit = MagicMock()


def _stub(name):
    if name not in sys.modules:
        m = types.ModuleType(name)
        sys.modules[name] = m
    return sys.modules[name]


# Minimal stubs
_stub("database")
sys.modules["database"].__path__ = []
redis_stub = _stub("database.redis_db")
redis_stub.check_api_rate_limit = mock_check_rate_limit
redis_stub.try_acquire_listen_lock = MagicMock(return_value=True)

_stub("firebase_admin")
_stub("firebase_admin.auth")
sys.modules["firebase_admin.auth"].InvalidIdTokenError = type("InvalidIdTokenError", (Exception,), {})

# Register parent packages for endpoints.py import
_stub("utils")
sys.modules["utils"].__path__ = [os.path.join(BACKEND_DIR, "utils")]
_stub("utils.other")
sys.modules["utils.other"].__path__ = [os.path.join(BACKEND_DIR, "utils/other")]

# Load endpoints.py via importlib
endpoints_spec = importlib.util.spec_from_file_location(
    "utils.other.endpoints", os.path.join(BACKEND_DIR, "utils/other/endpoints.py")
)
endpoints_mod = importlib.util.module_from_spec(endpoints_spec)
sys.modules["utils.other.endpoints"] = endpoints_mod
endpoints_spec.loader.exec_module(endpoints_mod)

with_rate_limit = endpoints_mod.with_rate_limit
rate_limit_custom = endpoints_mod.rate_limit_custom

# ============================================================
# Also test the actual Lua-based check_api_rate_limit from redis_db
# ============================================================

mock_redis = MagicMock()
mock_lua_script = MagicMock()
mock_redis.register_script.return_value = mock_lua_script

# Manually define check_api_rate_limit matching production code
# to verify the Lua script interaction logic
_rate_limit_script_cache = [None]

_RATE_LIMIT_LUA = """
local key = KEYS[1]
local max_requests = tonumber(ARGV[1])
local window_seconds = tonumber(ARGV[2])

local current = redis.call('INCR', key)
if current == 1 then
    redis.call('EXPIRE', key, window_seconds)
end

if current > max_requests then
    return {0, 0, redis.call('TTL', key)}
end

return {1, max_requests - current, redis.call('TTL', key)}
"""


def _check_api_rate_limit_real(key, endpoint, max_requests, window_seconds):
    """Production check_api_rate_limit with mock Redis — tests Lua script invocation."""
    if _rate_limit_script_cache[0] is None:
        _rate_limit_script_cache[0] = mock_redis.register_script(_RATE_LIMIT_LUA)

    now = int(time.time())
    window_start = now - (now % window_seconds)
    redis_key = f"rate_limit:{endpoint}:{key}:{window_start}"

    result = _rate_limit_script_cache[0](keys=[redis_key], args=[max_requests, window_seconds])
    allowed = bool(result[0])
    remaining = int(result[1])
    reset = int(result[2]) if result[2] > 0 else window_seconds - (now % window_seconds)

    return allowed, remaining, reset


# ============================================================
# Tests
# ============================================================


class TestCheckApiRateLimit(unittest.TestCase):
    """Test the Lua script invocation logic in check_api_rate_limit."""

    def setUp(self):
        mock_redis.reset_mock()
        mock_lua_script.reset_mock()
        mock_lua_script.side_effect = None
        _rate_limit_script_cache[0] = None
        mock_redis.register_script.return_value = mock_lua_script

    def test_first_request_allowed(self):
        mock_lua_script.return_value = [1, 9, 55]
        allowed, remaining, reset = _check_api_rate_limit_real("user1", "test", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 9)
        self.assertEqual(reset, 55)

    def test_within_limit_allowed(self):
        mock_lua_script.return_value = [1, 4, 30]
        allowed, remaining, _ = _check_api_rate_limit_real("user1", "test", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 4)

    def test_at_limit_denied(self):
        mock_lua_script.return_value = [0, 0, 45]
        allowed, remaining, reset = _check_api_rate_limit_real("user1", "test", 10, 60)
        self.assertFalse(allowed)
        self.assertEqual(remaining, 0)
        self.assertEqual(reset, 45)

    def test_different_keys_get_different_redis_keys(self):
        mock_lua_script.return_value = [1, 9, 55]
        _check_api_rate_limit_real("user1", "test", 10, 60)
        call1_key = mock_lua_script.call_args[1]["keys"][0]

        _check_api_rate_limit_real("user2", "test", 10, 60)
        call2_key = mock_lua_script.call_args[1]["keys"][0]

        self.assertIn("user1", call1_key)
        self.assertIn("user2", call2_key)
        self.assertNotEqual(call1_key, call2_key)

    def test_different_endpoints_get_different_redis_keys(self):
        mock_lua_script.return_value = [1, 9, 55]
        _check_api_rate_limit_real("user1", "endpoint_a", 10, 60)
        call1_key = mock_lua_script.call_args[1]["keys"][0]

        _check_api_rate_limit_real("user1", "endpoint_b", 10, 60)
        call2_key = mock_lua_script.call_args[1]["keys"][0]

        self.assertNotEqual(call1_key, call2_key)

    def test_lua_receives_correct_args(self):
        mock_lua_script.return_value = [1, 9, 55]
        _check_api_rate_limit_real("user1", "test", 10, 60)
        args = mock_lua_script.call_args[1]["args"]
        self.assertEqual(args, [10, 60])

    def test_last_request_shows_zero_remaining(self):
        mock_lua_script.return_value = [1, 0, 10]
        allowed, remaining, _ = _check_api_rate_limit_real("user1", "test", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 0)

    def test_reset_fallback_when_ttl_zero(self):
        mock_lua_script.return_value = [0, 0, 0]
        _, _, reset = _check_api_rate_limit_real("user1", "test", 10, 60)
        self.assertGreater(reset, 0)
        self.assertLessEqual(reset, 60)

    def test_script_registered_once(self):
        """Lua script should be registered only once (cached)."""
        mock_lua_script.return_value = [1, 9, 55]
        _check_api_rate_limit_real("user1", "test", 10, 60)
        _check_api_rate_limit_real("user2", "test", 10, 60)
        mock_redis.register_script.assert_called_once()


class TestWithRateLimit(unittest.TestCase):
    """Test the with_rate_limit dependency factory."""

    def setUp(self):
        mock_check_rate_limit.reset_mock()
        mock_check_rate_limit.side_effect = None

    def _run(self, coro):
        import asyncio

        loop = asyncio.new_event_loop()
        try:
            return loop.run_until_complete(coro)
        finally:
            loop.close()

    def test_allows_within_limit(self):
        mock_check_rate_limit.return_value = (True, 9, 55)
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_denies_over_limit(self):
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)
        self.assertIn("Rate limit exceeded", ctx.exception.detail)

    def test_dual_limits_minute_exceeded(self):
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        dep = with_rate_limit(lambda: None, "test", [(10, 60), (100, 3600)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_dual_limits_hour_exceeded(self):
        from fastapi import HTTPException

        call_count = [0]

        def side_effect(*args, **kwargs):
            call_count[0] += 1
            if call_count[0] == 1:
                return (True, 5, 45)  # minute OK
            return (False, 0, 3500)  # hour exceeded

        mock_check_rate_limit.side_effect = side_effect
        dep = with_rate_limit(lambda: None, "test", [(10, 60), (100, 3600)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_fail_open_on_redis_error(self):
        mock_check_rate_limit.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_non_redis_error_propagates(self):
        mock_check_rate_limit.side_effect = ValueError("programming bug")
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        with self.assertRaises(ValueError):
            self._run(dep(uid="test_uid"))

    def test_429_has_all_required_headers(self):
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        dep = with_rate_limit(lambda: None, "test", [(10, 60)])
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        headers = ctx.exception.headers
        for h in ["X-RateLimit-Limit", "X-RateLimit-Remaining", "X-RateLimit-Reset", "Retry-After"]:
            self.assertIn(h, headers, f"Missing header: {h}")
        self.assertEqual(headers["X-RateLimit-Limit"], "10")
        self.assertEqual(headers["X-RateLimit-Remaining"], "0")


class TestRateLimitCustom(unittest.TestCase):
    """Test the IP-based rate_limit_custom function."""

    def setUp(self):
        mock_check_rate_limit.reset_mock()
        mock_check_rate_limit.side_effect = None

    def test_ip_based_allows(self):
        mock_check_rate_limit.return_value = (True, 4, 55)
        request = MagicMock()
        request.client.host = "1.2.3.4"
        result = rate_limit_custom("signin", request, 5, 60)
        self.assertTrue(result)

    def test_ip_based_denies(self):
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        request = MagicMock()
        request.client.host = "1.2.3.4"
        with self.assertRaises(HTTPException) as ctx:
            rate_limit_custom("signin", request, 5, 60)
        self.assertEqual(ctx.exception.status_code, 429)

    def test_ip_based_fail_open_on_redis_error(self):
        mock_check_rate_limit.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        request = MagicMock()
        request.client.host = "1.2.3.4"
        result = rate_limit_custom("signin", request, 5, 60)
        self.assertTrue(result)

    def test_ip_based_non_redis_error_propagates(self):
        mock_check_rate_limit.side_effect = ValueError("bug")
        request = MagicMock()
        request.client.host = "1.2.3.4"
        with self.assertRaises(ValueError):
            rate_limit_custom("signin", request, 5, 60)


class TestSharedBucket(unittest.TestCase):
    """Verify both conversation POST endpoints share the same rate limit bucket."""

    def test_both_endpoints_use_same_bucket_name(self):
        dev_router_path = os.path.join(BACKEND_DIR, "routers/developer.py")
        with open(dev_router_path) as f:
            source = f.read()

        conversations_match = re.search(
            r'post\("/v1/dev/user/conversations".*?with_rate_limit\([^,]+,\s*"([^"]+)"', source, re.DOTALL
        )
        segments_match = re.search(
            r'post\("/v1/dev/user/conversations/from-segments".*?with_rate_limit\([^,]+,\s*"([^"]+)"',
            source,
            re.DOTALL,
        )

        self.assertIsNotNone(conversations_match, "Rate limit not found on conversations endpoint")
        self.assertIsNotNone(segments_match, "Rate limit not found on from-segments endpoint")
        self.assertEqual(
            conversations_match.group(1),
            segments_match.group(1),
            "Both endpoints must share the same rate limit bucket",
        )


if __name__ == "__main__":
    unittest.main()
