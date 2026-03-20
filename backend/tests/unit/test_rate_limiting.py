"""Tests for API rate limiting (issue #5835).

Covers:
1. check_api_rate_limit: real function with patched Redis (Lua script invocation)
2. with_rate_limit dependency: config-driven policy, fail-open, fail-closed
3. check_rate_limit_inline: inline rate limiting for custom auth patterns
4. rate_limit_custom (IP-based): allow, deny, fail-open on RedisError only
5. 429 response headers: X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, Retry-After
6. Shared bucket: both conversation POST endpoints share same rate limit bucket
7. Config registry: all policies valid, all cost endpoints covered
8. WebSocket concurrent session cap: real functions with patched Redis
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
# Setup: mock Redis, load real functions via importlib
# ============================================================

BACKEND_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))

# Mock Redis instance that will be injected into redis_db.py
mock_redis_instance = MagicMock()
mock_lua_script = MagicMock()
mock_redis_instance.register_script.return_value = mock_lua_script


def _stub(name):
    if name not in sys.modules:
        m = types.ModuleType(name)
        sys.modules[name] = m
    return sys.modules[name]


# Minimal stubs for firebase
_stub("firebase_admin")
_stub("firebase_admin.auth")
sys.modules["firebase_admin.auth"].InvalidIdTokenError = type("InvalidIdTokenError", (Exception,), {})

# Register parent packages
_stub("database")
sys.modules["database"].__path__ = []
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

# Load redis_db.py with mock Redis connection
# Patch redis.Redis to return our mock instance
_original_redis_cls = redis_pkg.Redis
redis_pkg.Redis = MagicMock(return_value=mock_redis_instance)
try:
    redis_db_spec = importlib.util.spec_from_file_location(
        "database.redis_db", os.path.join(BACKEND_DIR, "database/redis_db.py")
    )
    redis_db_mod = importlib.util.module_from_spec(redis_db_spec)
    sys.modules["database.redis_db"] = redis_db_mod
    redis_db_spec.loader.exec_module(redis_db_mod)
finally:
    redis_pkg.Redis = _original_redis_cls

# Real functions from redis_db.py
check_api_rate_limit = redis_db_mod.check_api_rate_limit
acquire_ws_session_slot = redis_db_mod.acquire_ws_session_slot
refresh_ws_session_slot = redis_db_mod.refresh_ws_session_slot
release_ws_session_slot = redis_db_mod.release_ws_session_slot

# Also re-export check_api_rate_limit on the stub for endpoints.py
redis_db_mod.try_acquire_listen_lock = MagicMock(return_value=True)

# Load endpoints.py (must be after redis_db and rate_limit_config are registered)
endpoints_spec = importlib.util.spec_from_file_location(
    "utils.other.endpoints", os.path.join(BACKEND_DIR, "utils/other/endpoints.py")
)
endpoints_mod = importlib.util.module_from_spec(endpoints_spec)
sys.modules["utils.other.endpoints"] = endpoints_mod
endpoints_spec.loader.exec_module(endpoints_mod)

with_rate_limit = endpoints_mod.with_rate_limit
check_rate_limit_inline = endpoints_mod.check_rate_limit_inline
rate_limit_custom = endpoints_mod.rate_limit_custom

# Reference to the mock check_api_rate_limit used by endpoints.py
mock_check_rate_limit = redis_db_mod.check_api_rate_limit


# ============================================================
# Tests
# ============================================================


class TestCheckApiRateLimit(unittest.TestCase):
    """Test the REAL check_api_rate_limit function with patched Redis."""

    def setUp(self):
        mock_redis_instance.reset_mock()
        mock_lua_script.reset_mock()
        mock_lua_script.side_effect = None
        # Reset the cached script so register_script is called fresh
        redis_db_mod._rate_limit_script = None
        mock_redis_instance.register_script.return_value = mock_lua_script

    def test_first_request_allowed(self):
        mock_lua_script.return_value = [1, 9, 55]
        allowed, remaining, reset = check_api_rate_limit("user1", "test", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 9)

    def test_within_limit_allowed(self):
        mock_lua_script.return_value = [1, 4, 30]
        allowed, remaining, _ = check_api_rate_limit("user1", "test", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 4)

    def test_at_limit_denied(self):
        mock_lua_script.return_value = [0, 0, 45]
        allowed, remaining, _ = check_api_rate_limit("user1", "test", 10, 60)
        self.assertFalse(allowed)
        self.assertEqual(remaining, 0)

    def test_different_keys_get_different_redis_keys(self):
        mock_lua_script.return_value = [1, 9, 55]
        check_api_rate_limit("user1", "test", 10, 60)
        call1_key = mock_lua_script.call_args[1]["keys"][0]

        check_api_rate_limit("user2", "test", 10, 60)
        call2_key = mock_lua_script.call_args[1]["keys"][0]

        self.assertIn("user1", call1_key)
        self.assertIn("user2", call2_key)
        self.assertNotEqual(call1_key, call2_key)

    def test_different_endpoints_get_different_redis_keys(self):
        mock_lua_script.return_value = [1, 9, 55]
        check_api_rate_limit("user1", "endpoint_a", 10, 60)
        call1_key = mock_lua_script.call_args[1]["keys"][0]

        check_api_rate_limit("user1", "endpoint_b", 10, 60)
        call2_key = mock_lua_script.call_args[1]["keys"][0]

        self.assertNotEqual(call1_key, call2_key)

    def test_lua_receives_correct_args(self):
        mock_lua_script.return_value = [1, 9, 55]
        check_api_rate_limit("user1", "test", 10, 60)
        args = mock_lua_script.call_args[1]["args"]
        self.assertEqual(args, [10, 60])

    def test_last_request_shows_zero_remaining(self):
        mock_lua_script.return_value = [1, 0, 10]
        allowed, remaining, _ = check_api_rate_limit("user1", "test", 10, 60)
        self.assertTrue(allowed)
        self.assertEqual(remaining, 0)

    def test_script_registered_once(self):
        """Lua script should be registered only once (cached)."""
        mock_lua_script.return_value = [1, 9, 55]
        check_api_rate_limit("user1", "test", 10, 60)
        check_api_rate_limit("user2", "test", 10, 60)
        mock_redis_instance.register_script.assert_called_once()

    def test_reset_uses_window_boundary_not_ttl(self):
        """Reset must be computed from window boundary, not Redis TTL."""
        mock_lua_script.return_value = [0, 0, 999]  # TTL=999 from Lua (ignored)
        with patch("database.redis_db.time") as mock_time:
            # 1000045 % 60 = 25, so 35s remain in window (not 999 from TTL)
            mock_time.time.return_value = 1000045.0
            _, _, reset = check_api_rate_limit("user1", "test", 10, 60)
            self.assertEqual(reset, 35)

    def test_reset_at_window_boundary(self):
        """At exact window boundary (now % window == 0), reset should equal window_seconds."""
        mock_lua_script.return_value = [1, 5, 60]
        with patch("database.redis_db.time") as mock_time:
            mock_time.time.return_value = 1000020.0  # 1000020 % 60 == 0
            _, _, reset = check_api_rate_limit("user1", "test", 10, 60)
            self.assertEqual(reset, 60)

    def test_key_includes_window_start(self):
        """Redis key must include window_start for fixed-window bucketing."""
        mock_lua_script.return_value = [1, 9, 55]
        with patch("database.redis_db.time") as mock_time:
            mock_time.time.return_value = 1000045.0
            check_api_rate_limit("user1", "test", 10, 60)
            key = mock_lua_script.call_args[1]["keys"][0]
            # window_start = 1000045 - (1000045 % 60) = 1000020
            self.assertIn("1000020", key)


class TestWithRateLimit(unittest.TestCase):
    """Test the config-driven with_rate_limit dependency factory."""

    def setUp(self):
        mock_redis_instance.reset_mock()
        mock_lua_script.reset_mock()
        mock_lua_script.side_effect = None
        redis_db_mod._rate_limit_script = None
        mock_redis_instance.register_script.return_value = mock_lua_script

    def _run(self, coro):
        import asyncio

        loop = asyncio.new_event_loop()
        try:
            return loop.run_until_complete(coro)
        finally:
            loop.close()

    def test_allows_within_limit(self):
        mock_lua_script.return_value = [1, 9, 55]
        dep = with_rate_limit(lambda: None, "chat_messages")
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_denies_over_limit(self):
        from fastapi import HTTPException

        mock_lua_script.return_value = [0, 0, 45]
        dep = with_rate_limit(lambda: None, "chat_messages")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)
        self.assertIn("Rate limit exceeded", ctx.exception.detail)

    def test_multi_window_minute_exceeded(self):
        """First window (minute) denies — should raise 429."""
        from fastapi import HTTPException

        mock_lua_script.return_value = [0, 0, 45]
        dep = with_rate_limit(lambda: None, "dev_conversations")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_multi_window_hour_exceeded(self):
        """Minute passes, hour denies — should raise 429."""
        from fastapi import HTTPException

        call_count = [0]

        def side_effect(**kwargs):
            call_count[0] += 1
            if call_count[0] == 1:
                return [1, 1, 45]  # minute OK
            return [0, 0, 3500]  # hour exceeded

        mock_lua_script.side_effect = side_effect
        dep = with_rate_limit(lambda: None, "dev_conversations")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_triple_window_daily_exceeded(self):
        """Minute and hour pass, daily denies — should raise 429."""
        from fastapi import HTTPException

        call_count = [0]

        def side_effect(**kwargs):
            call_count[0] += 1
            if call_count[0] <= 2:
                return [1, 1, 45]  # minute and hour OK
            return [0, 0, 80000]  # daily exceeded

        mock_lua_script.side_effect = side_effect
        dep = with_rate_limit(lambda: None, "dev_conversations")
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 429)

    def test_first_deny_short_circuits(self):
        """When first window denies, remaining windows should NOT be checked."""
        mock_lua_script.return_value = [0, 0, 45]
        dep = with_rate_limit(lambda: None, "dev_conversations")  # 3 windows
        from fastapi import HTTPException

        with self.assertRaises(HTTPException):
            self._run(dep(uid="test_uid"))
        # Only 1 call to Lua script, not 3
        self.assertEqual(mock_lua_script.call_count, 1)

    def test_fail_open_on_redis_error(self):
        """Non-fail_closed policy: allow on Redis error."""
        mock_lua_script.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        dep = with_rate_limit(lambda: None, "chat_messages")  # fail_closed=False
        result = self._run(dep(uid="test_uid"))
        self.assertEqual(result, "test_uid")

    def test_fail_closed_on_redis_error(self):
        """fail_closed=True policy: return 503 on Redis error."""
        from fastapi import HTTPException

        mock_lua_script.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        dep = with_rate_limit(lambda: None, "dev_conversations")  # fail_closed=True
        with self.assertRaises(HTTPException) as ctx:
            self._run(dep(uid="test_uid"))
        self.assertEqual(ctx.exception.status_code, 503)
        self.assertIn("Retry-After", ctx.exception.headers)

    def test_non_redis_error_propagates_regardless_of_fail_mode(self):
        mock_lua_script.side_effect = ValueError("programming bug")
        dep = with_rate_limit(lambda: None, "dev_conversations")  # fail_closed=True
        with self.assertRaises(ValueError):
            self._run(dep(uid="test_uid"))

    def test_429_has_all_required_headers(self):
        from fastapi import HTTPException

        mock_lua_script.return_value = [0, 0, 45]
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
        mock_redis_instance.reset_mock()
        mock_lua_script.reset_mock()
        mock_lua_script.side_effect = None
        redis_db_mod._rate_limit_script = None
        mock_redis_instance.register_script.return_value = mock_lua_script

    def test_allows_within_limit(self):
        mock_lua_script.return_value = [1, 9, 55]
        check_rate_limit_inline("user1", "mcp_sse")  # Should not raise

    def test_denies_over_limit(self):
        from fastapi import HTTPException

        mock_lua_script.return_value = [0, 0, 45]
        with self.assertRaises(HTTPException) as ctx:
            check_rate_limit_inline("user1", "mcp_sse")
        self.assertEqual(ctx.exception.status_code, 429)

    def test_fail_closed_returns_503(self):
        from fastapi import HTTPException

        mock_lua_script.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        with self.assertRaises(HTTPException) as ctx:
            check_rate_limit_inline("user1", "mcp_sse")  # fail_closed=True
        self.assertEqual(ctx.exception.status_code, 503)

    def test_fail_open_allows(self):
        mock_lua_script.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        check_rate_limit_inline("user1", "chat_messages")  # fail_closed=False, should not raise

    def test_composite_key_for_integration(self):
        mock_lua_script.return_value = [1, 9, 55]
        check_rate_limit_inline("app123:user456", "integration_conversations")
        key = mock_lua_script.call_args[1]["keys"][0]
        self.assertIn("app123:user456", key)

    def test_429_has_all_required_headers(self):
        """Inline limiter 429 must include standard rate limit headers."""
        from fastapi import HTTPException

        mock_lua_script.return_value = [0, 0, 45]
        with self.assertRaises(HTTPException) as ctx:
            check_rate_limit_inline("user1", "mcp_sse")
        headers = ctx.exception.headers
        for h in ["X-RateLimit-Limit", "X-RateLimit-Remaining", "X-RateLimit-Reset", "Retry-After"]:
            self.assertIn(h, headers, f"Missing header: {h}")

    def test_first_deny_short_circuits_multi_window(self):
        """When first window denies, remaining windows should NOT be checked."""
        # mcp_sse has 2 windows: (5, 60), (40, 3600)
        mock_lua_script.return_value = [0, 0, 45]
        from fastapi import HTTPException

        with self.assertRaises(HTTPException):
            check_rate_limit_inline("user1", "mcp_sse")
        # Only 1 call to Lua script, not 2
        self.assertEqual(mock_lua_script.call_count, 1)


class TestRateLimitCustom(unittest.TestCase):
    """Test the IP-based rate_limit_custom function."""

    def setUp(self):
        mock_redis_instance.reset_mock()
        mock_lua_script.reset_mock()
        mock_lua_script.side_effect = None
        redis_db_mod._rate_limit_script = None
        mock_redis_instance.register_script.return_value = mock_lua_script

    def test_ip_based_allows(self):
        mock_lua_script.return_value = [1, 4, 55]
        request = MagicMock()
        request.client.host = "1.2.3.4"
        result = rate_limit_custom("signin", request, 5, 60)
        self.assertTrue(result)

    def test_ip_based_denies(self):
        from fastapi import HTTPException

        mock_lua_script.return_value = [0, 0, 45]
        request = MagicMock()
        request.client.host = "1.2.3.4"
        with self.assertRaises(HTTPException) as ctx:
            rate_limit_custom("signin", request, 5, 60)
        self.assertEqual(ctx.exception.status_code, 429)

    def test_ip_based_fail_open_on_redis_error(self):
        mock_lua_script.side_effect = redis_pkg.exceptions.ConnectionError("Redis down")
        request = MagicMock()
        request.client.host = "1.2.3.4"
        result = rate_limit_custom("signin", request, 5, 60)
        self.assertTrue(result)

    def test_ip_based_non_redis_error_propagates(self):
        mock_lua_script.side_effect = ValueError("bug")
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
        self.assertEqual(conversations_match.group(1), "dev_conversations", "Shared bucket must be 'dev_conversations'")


class TestCostEndpointsCovered(unittest.TestCase):
    """Verify all cost-incurring endpoints have rate limiting applied."""

    def _read_source(self, filename):
        path = os.path.join(BACKEND_DIR, filename)
        with open(path) as f:
            return f.read()

    def _assert_route_has_policy(self, source, route_pattern, policy_name, description):
        """Assert a specific route uses a specific rate limit policy."""
        pattern = re.escape(route_pattern) + r'.*?with_rate_limit\([^,]+,\s*"' + re.escape(policy_name) + r'"'
        self.assertRegex(
            source, re.compile(pattern, re.DOTALL), f"{description}: route {route_pattern} must use policy {policy_name}"
        )

    def test_chat_endpoints_rate_limited(self):
        source = self._read_source("routers/chat.py")
        routes = {
            "/v2/messages": "chat_messages",
            "/v2/initial-message": "chat_initial",
            "/v2/voice-messages": "voice_messages",
            "/v2/voice-message/transcribe": "voice_transcribe",
            "/v1/initial-message": "chat_initial",
        }
        for route, policy in routes.items():
            self._assert_route_has_policy(source, route, policy, "chat.py")

    def test_conversation_cost_endpoints_rate_limited(self):
        source = self._read_source("routers/conversations.py")
        routes = {
            "/v1/conversations\"": "app_conversations",
            "/reprocess": "reprocess",
            "/search": "conversation_search",
            "/test-prompt": "test_prompt",
            "/merge": "merge_conversations",
        }
        for route, policy in routes.items():
            pattern = re.escape(route) + r'.*?with_rate_limit\([^,]+,\s*"' + re.escape(policy) + r'"'
            self.assertRegex(
                source, re.compile(pattern, re.DOTALL), f"Route {route} must use policy {policy}"
            )

    def test_developer_memory_endpoints_rate_limited(self):
        source = self._read_source("routers/developer.py")
        self._assert_route_has_policy(source, "/v1/dev/user/memories\"", "dev_memories", "developer.py single memory")
        self._assert_route_has_policy(source, "/v1/dev/user/memories/batch", "dev_memories_batch", "developer.py batch")

    def test_goals_llm_endpoints_rate_limited(self):
        source = self._read_source("routers/goals.py")
        for policy in ["goals_suggest", "goals_advice", "goals_extract"]:
            self.assertRegex(
                source,
                re.compile(r'with_rate_limit\([^,]+,\s*"' + re.escape(policy) + r'"'),
                f"Missing policy {policy} in goals.py",
            )

    def test_knowledge_graph_rebuild_rate_limited(self):
        source = self._read_source("routers/knowledge_graph.py")
        self.assertRegex(
            source,
            re.compile(r'with_rate_limit\([^,]+,\s*"knowledge_graph_rebuild"'),
            "Missing knowledge_graph_rebuild policy",
        )

    def test_wrapped_generate_rate_limited(self):
        source = self._read_source("routers/wrapped.py")
        self.assertRegex(
            source,
            re.compile(r'with_rate_limit\([^,]+,\s*"wrapped_generate"'),
            "Missing wrapped_generate policy",
        )

    def test_agent_execute_tool_rate_limited(self):
        source = self._read_source("routers/agent_tools.py")
        self.assertRegex(
            source,
            re.compile(r'with_rate_limit\([^,]+,\s*"agent_execute_tool"'),
            "Missing agent_execute_tool policy",
        )

    def test_mcp_sse_rate_limited(self):
        source = self._read_source("routers/mcp_sse.py")
        self.assertIn("check_rate_limit_inline", source)
        self.assertIn('"mcp_sse"', source)

    def test_mcp_batch_rate_limited_per_message(self):
        """MCP must rate limit per-message, not per-request, to prevent batch bypass."""
        source = self._read_source("routers/mcp_sse.py")
        self.assertRegex(source, r'for .+ in messages:\s+check_rate_limit_inline')

    def test_integration_conversations_rate_limited(self):
        source = self._read_source("routers/integration.py")
        self.assertIn('"integration_conversations"', source)
        self.assertIn("check_rate_limit_inline", source)

    def test_integration_memories_rate_limited(self):
        source = self._read_source("routers/integration.py")
        self.assertIn('"integration_memories"', source)

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
        for route in ["/v2/files", "/v1/files"]:
            self._assert_route_has_policy(source, route, "file_upload", "chat.py file upload")


class TestWebSocketSessionCap(unittest.TestCase):
    """Test REAL WebSocket session cap functions with patched Redis."""

    def setUp(self):
        mock_redis_instance.reset_mock()
        # Reset cached scripts
        redis_db_mod._ws_session_acquire_script = None

    def test_acquire_registers_script_and_calls_it(self):
        """acquire_ws_session_slot must register Lua script and call it."""
        mock_script = MagicMock(return_value=1)
        mock_redis_instance.register_script.return_value = mock_script
        result = acquire_ws_session_slot("user1", "sess1")
        self.assertTrue(result)
        mock_redis_instance.register_script.assert_called_once()
        mock_script.assert_called_once()
        # Verify key contains uid
        call_kwargs = mock_script.call_args[1]
        self.assertEqual(call_kwargs["keys"], ["ws_sessions:user1"])

    def test_acquire_denied_when_at_cap(self):
        mock_script = MagicMock(return_value=0)
        mock_redis_instance.register_script.return_value = mock_script
        result = acquire_ws_session_slot("user1", "sess1")
        self.assertFalse(result)

    def test_acquire_passes_correct_args(self):
        mock_script = MagicMock(return_value=1)
        mock_redis_instance.register_script.return_value = mock_script
        acquire_ws_session_slot("user1", "sess1", max_concurrent=3, max_duration=9000)
        args = mock_script.call_args[1]["args"]
        self.assertEqual(args[0], "sess1")  # session_id
        self.assertEqual(args[2], 3)  # max_concurrent
        self.assertEqual(args[3], 9000)  # max_duration

    def test_release_calls_zrem(self):
        release_ws_session_slot("user1", "session123")
        mock_redis_instance.zrem.assert_called_once_with("ws_sessions:user1", "session123")

    def test_refresh_calls_zadd_and_expire(self):
        """Heartbeat refresh must update score AND extend key TTL."""
        refresh_ws_session_slot("user1", "session123")
        mock_redis_instance.zadd.assert_called_once()
        # Verify zadd key and session
        zadd_args = mock_redis_instance.zadd.call_args
        self.assertEqual(zadd_args[0][0], "ws_sessions:user1")
        # Verify expire is called with max_duration
        mock_redis_instance.expire.assert_called_once_with("ws_sessions:user1", 7200)

    def test_refresh_custom_duration(self):
        refresh_ws_session_slot("user1", "session123", max_duration=14400)
        mock_redis_instance.expire.assert_called_once_with("ws_sessions:user1", 14400)

    def test_acquire_script_cached(self):
        """Script registration should happen only once."""
        mock_script = MagicMock(return_value=1)
        mock_redis_instance.register_script.return_value = mock_script
        acquire_ws_session_slot("user1", "sess1")
        acquire_ws_session_slot("user2", "sess2")
        mock_redis_instance.register_script.assert_called_once()


if __name__ == "__main__":
    unittest.main()
