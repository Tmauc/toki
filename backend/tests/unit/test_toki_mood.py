"""
Unit tests for Toki — Feature 5: Mood Trends

Tests:
- extract_mood() error resilience (returns None on error)
- get_trends() groups entries by day correctly
- MoodTrend avg_score calculation
- Router GET /v1/toki/mood/trends
- Router GET /v1/toki/mood/entries
"""

import sys
from datetime import datetime, timezone, timedelta
from unittest.mock import MagicMock, patch

import pytest


# ─── Stub heavy dependencies before any project import ───────

def _stub(name: str) -> MagicMock:
    m = MagicMock()
    sys.modules.setdefault(name, m)
    return m


# google.cloud stubs
_stub('google')
_stub('google.cloud')
_stub('google.cloud.firestore_v1')

# firebase_admin stubs
_stub('firebase_admin')
_stub('firebase_admin.auth')
_stub('firebase_admin.credentials')

# redis stubs
_stub('redis')
_stub('redis.asyncio')

# internal stubs
_stub('database.redis_db')
_stub('database._client')

# LLM stubs so utils.llm.toki can be imported without real API keys
for _mod in (
    'anthropic', 'langchain_openai', 'tiktoken',
    'langchain_core', 'langchain_core.output_parsers', 'langchain_core.prompts',
    'utils.llm.clients',
):
    sys.modules[_mod] = MagicMock()

import utils.llm.toki  # noqa: E402 — must be after stubs

from fastapi.testclient import TestClient
from fastapi import FastAPI

from routers.toki_mood import router, MOOD_SCORE
from utils.other.endpoints import get_current_user_uid

TEST_UID = 'test_mood_user_001'

app = FastAPI()
app.include_router(router)
app.dependency_overrides[get_current_user_uid] = lambda: TEST_UID

client = TestClient(app)


# ─── Helpers ─────────────────────────────────────────────────

def _make_entry(mood: str, energy: str = 'medium', day: str = '2026-03-28', conv_id: str = 'conv-1') -> dict:
    return {
        'id': f'mood-{mood}-{day}',
        'mood': mood,
        'energy': energy,
        'signals': ['some signal'],
        'confidence': 0.8,
        'conversation_id': conv_id,
        'created_at': f'{day}T10:00:00+00:00',
    }


# ─── extract_mood tests ───────────────────────────────────────

class TestExtractMood:
    def test_returns_none_on_llm_error(self):
        """extract_mood should catch exceptions and return None."""
        with patch('utils.llm.toki.llm_mini') as mock_llm:
            mock_llm.__ror__ = MagicMock(side_effect=Exception("LLM unavailable"))
            from utils.llm.toki import extract_mood
            result = extract_mood(
                transcript="J'ai eu une super journée !",
                user_name="Alice",
                conversation_date=datetime.now(timezone.utc),
            )
            # Should return None (from exception handler), not raise
            assert result is None

    def test_returns_none_on_chain_error(self):
        """extract_mood should return None when the LangChain chain raises."""
        with patch('utils.llm.toki._mood_prompt') as mock_prompt:
            mock_chain = MagicMock()
            mock_chain.invoke.side_effect = RuntimeError("chain failed")
            mock_prompt.__or__ = MagicMock(return_value=mock_chain)
            from utils.llm.toki import extract_mood
            result = extract_mood(
                transcript="Short transcript",
                user_name="Bob",
                conversation_date=datetime.now(timezone.utc),
            )
            assert result is None


# ─── Trends grouping logic tests ─────────────────────────────

class TestTrendsGrouping:
    def test_groups_entries_by_day(self):
        """get_trends groups multiple entries from the same day into one MoodTrend."""
        entries = [
            _make_entry('good', day='2026-03-25', conv_id='c1'),
            _make_entry('great', day='2026-03-25', conv_id='c2'),
            _make_entry('neutral', day='2026-03-26', conv_id='c3'),
        ]
        with patch('routers.toki_mood.mood_db.get_mood_entries', return_value=entries):
            resp = client.get('/v1/toki/mood/trends?days=30')
        assert resp.status_code == 200
        data = resp.json()
        assert len(data) == 2
        days = [d['date'] for d in data]
        assert '2026-03-25' in days
        assert '2026-03-26' in days

    def test_avg_score_calculation(self):
        """get_trends avg_score is the mean of per-entry scores for the day."""
        # good=4, great=5 → avg = 4.5
        entries = [
            _make_entry('good', day='2026-03-27', conv_id='c1'),
            _make_entry('great', day='2026-03-27', conv_id='c2'),
        ]
        with patch('routers.toki_mood.mood_db.get_mood_entries', return_value=entries):
            resp = client.get('/v1/toki/mood/trends?days=30')
        assert resp.status_code == 200
        data = resp.json()
        assert len(data) == 1
        assert data[0]['avg_score'] == 4.5

    def test_dominant_mood_uses_most_frequent(self):
        """get_trends dominant_mood picks the mode of moods for the day."""
        entries = [
            _make_entry('good', day='2026-03-28', conv_id='c1'),
            _make_entry('good', day='2026-03-28', conv_id='c2'),
            _make_entry('great', day='2026-03-28', conv_id='c3'),
        ]
        with patch('routers.toki_mood.mood_db.get_mood_entries', return_value=entries):
            resp = client.get('/v1/toki/mood/trends?days=30')
        data = resp.json()
        assert data[0]['dominant_mood'] == 'good'

    def test_trends_returns_empty_list_on_no_data(self):
        """get_trends returns [] when there are no mood entries."""
        with patch('routers.toki_mood.mood_db.get_mood_entries', return_value=[]):
            resp = client.get('/v1/toki/mood/trends?days=30')
        assert resp.status_code == 200
        assert resp.json() == []


# ─── Router tests ─────────────────────────────────────────────

class TestMoodRouter:
    def test_entries_endpoint_returns_200(self):
        """GET /v1/toki/mood/entries returns 200 with scored entries."""
        entries = [_make_entry('great', day='2026-03-28')]
        with patch('routers.toki_mood.mood_db.get_mood_entries', return_value=entries):
            resp = client.get('/v1/toki/mood/entries?days=7')
        assert resp.status_code == 200
        data = resp.json()
        assert len(data) == 1
        assert data[0]['score'] == MOOD_SCORE['great']  # 5

    def test_entries_score_uses_mood_score_map(self):
        """GET /v1/toki/mood/entries enriches each entry with its numeric score."""
        entries = [
            _make_entry('stressed', day='2026-03-28', conv_id='c1'),
            _make_entry('neutral', day='2026-03-27', conv_id='c2'),
        ]
        with patch('routers.toki_mood.mood_db.get_mood_entries', return_value=entries):
            resp = client.get('/v1/toki/mood/entries?days=30')
        data = resp.json()
        scores = {e['mood']: e['score'] for e in data}
        assert scores['stressed'] == MOOD_SCORE['stressed']  # 2
        assert scores['neutral'] == MOOD_SCORE['neutral']    # 3
