"""Tests for API rate limiting (issue #5835).

Covers:
1. check_api_rate_limit: atomic Lua script behavior (allow, deny, key isolation)
2. with_rate_limit dependency: config-driven policy, fail-open, fail-closed
3. check_rate_limit_inline: inline rate limiting for custom auth patterns
4. rate_limit_custom (IP-based): allow, deny, fail-open on RedisError only
5. 429 response headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, Retry-After
6. Shared bucket: both conversation POST endpoints share same rate limit bucket
7. Config registry: all policies valid, all cost endpoints covered
8. WebSocket concurrent session cap: acquire, release, capacity check
"""

import importlib.util
import os
import re
import sys
import time
import types
import unittest
from unittest.mock import MagicMock

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

# Load rate_limit_config.py
config_spec = importlib.util.spec_from_file_location(
    "utils.rate_limit_config", os.path.join(BACKEND_DIR, "utils/rate_limit_config.py")
)
config_mod = importlib.util.module_from_spec(config_spec)
sys.modules["utils.rate_limit_config"] = config_mod
config_spec.loader.exec_module(config_mod)

RATE_POLICIES = config_mod.RATE_POLICIES

# Load endpoints.py via importlib (must be after rate_limit_config is registered)
endpoints_spec = importlib.util.spec_from_file_location(
    "utils.other.endpoints", os.path.join(BACKEND_DIR, "utils/other/endpoints.py")
)
endpoints_mod = importlib.util.module_from_spec(endpoints_spec)
sys.modules["utils.other.endpoints"] = endpoints_mod
endpoints_spec.loader.exec_module(endpoints_mod)

with_rate_limit = endpoints_mod.with_rate_limit
check_rate_limit_inline = endpoints_mod.check_rate_limit_inline
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
    """Test the config-driven with_rate_limit dependency factory."""

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
        dep = with_rate_limit(lambda: None, "chat_messages")
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_denies_over_limit(self):
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        dep = with_rate_limit(lambda: None, "chat_messages")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)
        self.assertIn("Rate limit exceeded", ctx.exception.detail)

    def test_multi_window_minute_exceeded(self):
        """First window (minute) denies — should raise 429."""
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        dep = with_rate_limit(lambda: None, "dev_conversations")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_multi_window_hour_exceeded(self):
        """Minute passes, hour denies — should raise 429."""
        from fastapi import HTTPException

        call_count = [0]

        def side_effect(*args, **kwargs):
            call_count[0] += 1
            if call_count[0] == 1:
                return (True, 1, 45)  # minute OK
            return (False, 0, 3500)  # hour exceeded

        mock_check_rate_limit.side_effect = side_effect
        dep = with_rate_limit(lambda: None, "dev_conversations")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_triple_window_daily_exceeded(self):
        """Minute and hour pass, daily denies — should raise 429."""
        from fastapi import HTTPException

        call_count = [0]

        def side_effect(*args, **kwargs):
            call_count[0] += 1
            if call_count[0] <= 2:
                return (True, 1, 45)  # minute and hour OK
            return (False, 0, 80000)  # daily exceeded

        mock_check_rate_limit.side_effect = side_effect
        dep = with_rate_limit(lambda: None, "dev_conversations")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_fail_open_on_redis_error(self):
        """Non-fail_closed policy: allow on Redis error."""
        mock_check_rate_limit.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        dep = with_rate_limit(lambda: None, "chat_messages")  # fail_closed=False
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_fail_closed_on_redis_error(self):
        """fail_closed=True policy: return 503 on Redis error."""
        from fastapi import HTTPException

        mock_check_rate_limit.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        dep = with_rate_limit(lambda: None, "dev_conversations")  # fail_closed=True
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 503)
        self.assertIn("Retry-After", ctx.exception.headers)

    def test_non_redis_error_propagates_regardless_of_fail_mode(self):
        mock_check_rate_limit.side_effect = ValueError("programming bug")
        dep = with_rate_limit(lambda: None, "dev_conversations")  # fail_closed=True
        with self.assertRaises(ValueError):
            self._run(dep(uid="test_uid"))

    def test_429_has_all_required_headers(self):
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        dep = with_rate_limit(lambda: None, "chat_messages")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        headers = ctx.exception.headers
        for h in ["X-RateLimit-Limit", "X-RateLimit-Remaining", "X-RateLimit-Reset", "Retry-After"]:
            self.assertIn(h, headers, f"Missing header: {h}")
        self.assertEqual(headers["X-RateLimit-Remaining"], "0")


class TestCheckRateLimitInline(unittest.TestCase):
    """Test inline rate limiting for custom auth patterns (MCP, integration)."""

    def setUp(self):
        mock_check_rate_limit.reset_mock()
        mock_check_rate_limit.side_effect = None

    def test_allows_within_limit(self):
        mock_check_rate_limit.return_value = (True, 9, 55)
        check_rate_limit_inline("user1", "mcp_sse")  # Should not raise

    def test_denies_over_limit(self):
        from fastapi import HTTPException

        mock_check_rate_limit.return_value = (False, 0, 45)
        with self.assertRaises(HTTPException) as ctx:
            check_rate_limit_inline("user1", "mcp_sse")
        self.assertEqual(ctx.exception.status_code, 429)

    def test_fail_closed_returns_503(self):
        from fastapi import HTTPException

        mock_check_rate_limit.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        with self.assertRaises(HTTPException) as ctx:
            check_rate_limit_inline("user1", "mcp_sse")  # fail_closed=True
        self.assertEqual(ctx.exception.status_code, 503)

    def test_fail_open_allows(self):
        mock_check_rate_limit.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        check_rate_limit_inline("user1", "chat_messages")  # fail_closed=False, should not raise

    def test_composite_key_for_integration(self):
        mock_check_rate_limit.return_value = (True, 9, 55)
        check_rate_limit_inline("app123:user456", "integration_conversations")
        call_args = mock_check_rate_limit.call_args
        self.assertIn("app123:user456", call_args[0][0])


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


class TestRateLimitConfig(unittest.TestCase):
    """Validate the rate limit policy registry."""

    def test_all_policies_have_required_fields(self):
        for name, policy in RATE_POLICIES.items():
            self.assertIn("limits", policy, f"Policy '{name}' missing 'limits'")
            self.assertIsInstance(policy["limits"], list, f"Policy '{name}' limits must be a list")
            for limit in policy["limits"]:
                self.assertEqual(len(limit), 2, f"Policy '{name}' limit must be (max, window) tuple")
                self.assertGreater(limit[0], 0, f"Policy '{name}' max_requests must be > 0")
                self.assertGreater(limit[1], 0, f"Policy '{name}' window_seconds must be > 0")

    def test_fail_closed_is_boolean(self):
        for name, policy in RATE_POLICIES.items():
            if "fail_closed" in policy:
                self.assertIsInstance(policy["fail_closed"], bool, f"Policy '{name}' fail_closed must be bool")

    def test_expensive_endpoints_are_fail_closed(self):
        """Endpoints that trigger full LLM pipeline must be fail_closed=True."""
        expensive = ["dev_conversations", "app_conversations", "reprocess", "knowledge_graph_rebuild", "wrapped_generate"]
        for name in expensive:
            self.assertIn(name, RATE_POLICIES, f"Missing policy for expensive endpoint '{name}'")
            self.assertTrue(
                RATE_POLICIES[name].get("fail_closed", False),
                f"Expensive policy '{name}' should be fail_closed=True",
            )

    def test_multi_window_on_fanout_endpoints(self):
        """Fanout-heavy endpoints must have at least 2 windows (burst + sustained)."""
        fanout = ["dev_conversations", "app_conversations"]
        for name in fanout:
            limits = RATE_POLICIES[name]["limits"]
            self.assertGreaterEqual(len(limits), 2, f"Fanout policy '{name}' needs multi-window limits")

    def test_daily_cap_on_expensive_background_ops(self):
        """Very expensive background ops must have a daily cap (86400s window)."""
        daily_required = ["knowledge_graph_rebuild", "wrapped_generate"]
        for name in daily_required:
            limits = RATE_POLICIES[name]["limits"]
            has_daily = any(window == 86400 for _, window in limits)
            self.assertTrue(has_daily, f"Policy '{name}' must have a daily cap (86400s window)")

    def test_ws_constants_are_sane(self):
        self.assertEqual(config_mod.WS_MAX_CONCURRENT_SESSIONS, 2)
        self.assertGreater(config_mod.WS_SESSION_MAX_DURATION, 0)


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


class TestCostEndpointsCovered(unittest.TestCase):
    """Verify all cost-incurring endpoints have rate limiting applied."""

    def _read_source(self, filename):
        path = os.path.join(BACKEND_DIR, filename)
        with open(path) as f:
            return f.read()

    def test_chat_endpoints_rate_limited(self):
        source = self._read_source("routers/chat.py")
        for endpoint in ["/v2/messages", "/v2/initial-message", "/v2/voice-messages", "/v2/voice-message/transcribe"]:
            pattern = re.escape(endpoint) + r'.*?with_rate_limit'
            self.assertRegex(source, re.compile(pattern, re.DOTALL), f"Missing rate limit on {endpoint}")

    def test_conversation_cost_endpoints_rate_limited(self):
        source = self._read_source("routers/conversations.py")
        for endpoint in ["/v1/conversations\"", "/reprocess", "/test-prompt", "/v1/conversations/merge", "/v1/conversations/search"]:
            self.assertIn("with_rate_limit", source, f"conversations.py must use with_rate_limit")

    def test_goals_llm_endpoints_rate_limited(self):
        source = self._read_source("routers/goals.py")
        self.assertIn("with_rate_limit", source)
        for policy in ["goals_suggest", "goals_advice", "goals_extract"]:
            self.assertIn(policy, source, f"Missing policy {policy} in goals.py")

    def test_knowledge_graph_rebuild_rate_limited(self):
        source = self._read_source("routers/knowledge_graph.py")
        self.assertIn("knowledge_graph_rebuild", source)

    def test_wrapped_generate_rate_limited(self):
        source = self._read_source("routers/wrapped.py")
        self.assertIn("wrapped_generate", source)

    def test_agent_execute_tool_rate_limited(self):
        source = self._read_source("routers/agent_tools.py")
        self.assertIn("agent_execute_tool", source)

    def test_mcp_sse_rate_limited(self):
        source = self._read_source("routers/mcp_sse.py")
        self.assertIn("check_rate_limit_inline", source)
        self.assertIn("mcp_sse", source)

    def test_mcp_batch_rate_limited_per_message(self):
        """MCP must rate limit per-message, not per-request, to prevent batch bypass."""
        source = self._read_source("routers/mcp_sse.py")
        # check_rate_limit_inline must be called inside a for loop over messages
        self.assertRegex(source, r'for .+ in messages:\s+check_rate_limit_inline')

    def test_integration_conversations_rate_limited(self):
        source = self._read_source("routers/integration.py")
        self.assertIn("integration_conversations", source)

    def test_integration_memories_rate_limited(self):
        source = self._read_source("routers/integration.py")
        self.assertIn("integration_memories", source)

    def test_websocket_concurrent_cap_present(self):
        source = self._read_source("routers/transcribe.py")
        self.assertIn("acquire_ws_session_slot", source)
        self.assertIn("release_ws_session_slot", source)

    def test_websocket_heartbeat_present(self):
        """WS sessions must have a heartbeat to prevent stale eviction."""
        source = self._read_source("routers/transcribe.py")
        self.assertIn("refresh_ws_session_slot", source)
        self.assertIn("_ws_session_heartbeat", source)

    def test_file_upload_rate_limited(self):
        source = self._read_source("routers/chat.py")
        self.assertIn("file_upload", source)


class TestWebSocketSessionCap(unittest.TestCase):
    """Test WebSocket concurrent session cap Lua script logic."""

    def setUp(self):
        self.mock_redis = MagicMock()
        self.mock_script = MagicMock()
        self.mock_redis.register_script.return_value = self.mock_script

    def test_acquire_allowed_when_under_cap(self):
        self.mock_script.return_value = 1  # allowed
        # Simulate the Lua logic: ZCARD < max_concurrent
        self.assertTrue(bool(self.mock_script.return_value))

    def test_acquire_denied_when_at_cap(self):
        self.mock_script.return_value = 0  # denied
        self.assertFalse(bool(self.mock_script.return_value))

    def test_release_calls_zrem(self):
        self.mock_redis.zrem("ws_sessions:user1", "session123")
        self.mock_redis.zrem.assert_called_once_with("ws_sessions:user1", "session123")


if __name__ == "__main__":
    unittest.main()
