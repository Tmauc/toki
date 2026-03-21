"""
Central rate limit policy registry.

All rate limit policies are defined here. Routers import policy names and pass
them to with_rate_limit() or check_rate_limit_inline() — no hardcoded limits in
router files.

Policy structure:
    "policy_name": {
        "limits": [(max_requests, window_seconds), ...],
        "fail_closed": bool,  # True = 503 on Redis error, False = allow through
        "class": str,  # "service_health" or "user_budgeting"
    }

Classification:
    SERVICE_HEALTH: Protects backend from overload, burst storms, abuse.
        - Burst (per-minute) limits only, no daily caps.
        - fail_closed depends on cost.
    USER_BUDGETING: Protects per-user cost budget, fair-use allocation.
        - Multi-window: burst + sustained + daily cap.
        - fail_closed=True (expensive ops must not bypass budget on Redis error).

All limits are per-UID (user-based). Only pre-auth endpoints (signin)
use IP-based limiting as a fallback.
"""

RATE_POLICIES = {
    # =====================================================================
    # USER_BUDGETING: Full conversation pipeline (~22 OpenAI calls each)
    # =====================================================================
    "dev_conversations": {
        "limits": [(3, 60), (25, 3600), (60, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "app_conversations": {
        "limits": [(2, 60), (8, 3600), (20, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "reprocess": {
        "limits": [(1, 3600), (3, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "merge_conversations": {
        "limits": [(2, 3600), (5, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    # =====================================================================
    # USER_BUDGETING: Chat/Voice (2-6 OpenAI calls + Deepgram)
    # =====================================================================
    "chat_messages": {
        "limits": [(15, 60), (120, 3600), (300, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "chat_initial": {
        "limits": [(6, 60), (30, 3600), (80, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "voice_messages": {
        "limits": [(3, 60), (20, 3600), (60, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "voice_transcribe": {
        "limits": [(3, 60), (20, 3600), (60, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "file_upload": {
        "limits": [(3, 60), (15, 3600), (40, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    # =====================================================================
    # SERVICE_HEALTH: Agent/MCP — burst protection for bursty tools
    # =====================================================================
    "agent_execute_tool": {
        "limits": [(10, 60), (100, 3600)],
        "fail_closed": True,
        "class": "service_health",
    },
    "mcp_sse": {
        "limits": [(20, 60), (180, 3600)],
        "fail_closed": True,
        "class": "service_health",
    },
    # =====================================================================
    # USER_BUDGETING: Memories (single LLM call each)
    # =====================================================================
    "dev_memories": {
        "limits": [(20, 60), (120, 3600), (300, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "dev_memories_batch": {
        "limits": [(3, 60), (15, 3600), (40, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    # =====================================================================
    # USER_BUDGETING: Goals (single LLM call)
    # =====================================================================
    "goals_suggest": {
        "limits": [(6, 60), (30, 3600), (60, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "goals_advice": {
        "limits": [(6, 60), (30, 3600), (60, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "goals_extract": {
        "limits": [(6, 60), (30, 3600), (60, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    # =====================================================================
    # SERVICE_HEALTH: Search and test endpoints
    # =====================================================================
    "conversation_search": {
        "limits": [(20, 60), (120, 3600)],
        "fail_closed": False,
        "class": "service_health",
    },
    "test_prompt": {
        "limits": [(5, 60), (30, 3600)],
        "fail_closed": False,
        "class": "service_health",
    },
    # =====================================================================
    # USER_BUDGETING: Very expensive background ops
    # =====================================================================
    "knowledge_graph_rebuild": {
        "limits": [(1, 3600), (2, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "wrapped_generate": {
        "limits": [(2, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    # =====================================================================
    # USER_BUDGETING: Integration (per-app+user composite key)
    # =====================================================================
    "integration_conversations": {
        "limits": [(3, 60), (10, 3600), (50, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "integration_memories": {
        "limits": [(10, 60), (60, 3600), (200, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    # =====================================================================
    # USER_BUDGETING: Phone verification (per-UID, not IP)
    # =====================================================================
    "phone_verify": {
        "limits": [(5, 3600), (10, 86400)],
        "fail_closed": True,
        "class": "user_budgeting",
    },
    "phone_verify_check": {
        "limits": [(30, 60)],
        "fail_closed": False,
        "class": "service_health",
    },
}

# Maximum concurrent WebSocket STT sessions per UID
WS_MAX_CONCURRENT_SESSIONS = 2
WS_SESSION_MAX_DURATION = 7200  # 2 hours
