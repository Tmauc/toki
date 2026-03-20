"""
Central rate limit policy registry.

All rate limit policies are defined here. Routers import policy names and pass
them to with_rate_limit() or check_api_rate_limit() — no hardcoded limits in
router files.

Policy structure:
    "policy_name": {
        "limits": [(max_requests, window_seconds), ...],
        "fail_closed": bool,  # True = 503 on Redis error, False = allow through
    }

Design rationale (Codex-reviewed):
    - Multi-window stacking (burst + sustained + daily) on expensive paths
    - Tighter limits on fanout-heavy endpoints (~22 LLM calls per request)
    - Shared buckets for endpoints hitting the same expensive pipeline
    - fail_closed=True for expensive paths, False for low-cost reads
"""

RATE_POLICIES = {
    # === FANOUT-HEAVY: Full conversation pipeline (~22 OpenAI calls each) ===
    "dev_conversations": {
        "limits": [(2, 60), (20, 3600), (100, 86400)],
        "fail_closed": True,
    },
    "app_conversations": {
        "limits": [(2, 60), (20, 3600), (100, 86400)],
        "fail_closed": True,
    },
    "reprocess": {
        "limits": [(1, 3600), (5, 86400)],
        "fail_closed": True,
    },
    "merge_conversations": {
        "limits": [(5, 3600)],
        "fail_closed": True,
    },
    # === EXPENSIVE: Chat/Voice (2-6 OpenAI calls + Deepgram) ===
    "chat_messages": {
        "limits": [(30, 60)],
        "fail_closed": False,
    },
    "chat_initial": {
        "limits": [(10, 60)],
        "fail_closed": False,
    },
    "voice_messages": {
        "limits": [(3, 60), (30, 3600)],
        "fail_closed": True,
    },
    "voice_transcribe": {
        "limits": [(3, 60), (30, 3600)],
        "fail_closed": True,
    },
    "file_upload": {
        "limits": [(5, 60)],
        "fail_closed": False,
    },
    # === AGENT/MCP: Fanout amplifiers ===
    "agent_execute_tool": {
        "limits": [(5, 60), (40, 3600)],
        "fail_closed": True,
    },
    "mcp_sse": {
        "limits": [(5, 60), (40, 3600)],
        "fail_closed": True,
    },
    # === MODERATE: Single LLM call ===
    "dev_memories": {
        "limits": [(30, 60)],
        "fail_closed": False,
    },
    "dev_memories_batch": {
        "limits": [(5, 60)],
        "fail_closed": True,
    },
    "goals_suggest": {
        "limits": [(10, 60)],
        "fail_closed": False,
    },
    "goals_advice": {
        "limits": [(10, 60)],
        "fail_closed": False,
    },
    "goals_extract": {
        "limits": [(10, 60)],
        "fail_closed": False,
    },
    "conversation_search": {
        "limits": [(30, 60)],
        "fail_closed": False,
    },
    "test_prompt": {
        "limits": [(10, 60)],
        "fail_closed": False,
    },
    # === VERY EXPENSIVE BACKGROUND OPS ===
    "knowledge_graph_rebuild": {
        "limits": [(1, 3600), (3, 86400)],
        "fail_closed": True,
    },
    "wrapped_generate": {
        "limits": [(2, 86400)],
        "fail_closed": True,
    },
    # === INTEGRATION (per-app+user) ===
    "integration_conversations": {
        "limits": [(10, 3600)],
        "fail_closed": True,
    },
    "integration_memories": {
        "limits": [(30, 3600)],
        "fail_closed": False,
    },
}

# Maximum concurrent WebSocket STT sessions per UID
WS_MAX_CONCURRENT_SESSIONS = 2
WS_SESSION_MAX_DURATION = 7200  # 2 hours
