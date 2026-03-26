"""
Unit tests for Toki — routers/toki_voice_personas.py

Tests the routing/validation logic in isolation using mocked DB calls.
No real Firestore or Firebase auth required.
"""

import uuid
from datetime import datetime, timezone
from typing import List
from unittest.mock import MagicMock, patch

import pytest

# ─── Mock heavy dependencies before importing the router ─────

import sys

def _stub(name: str) -> MagicMock:
    m = MagicMock()
    sys.modules.setdefault(name, m)
    return m

# google.cloud stubs
_g = _stub('google')
_gc = _stub('google.cloud')
_gcf = _stub('google.cloud.firestore_v1')
_gcf.FieldFilter = MagicMock

# firebase_admin stubs
_stub('firebase_admin')
_stub('firebase_admin.auth')
_stub('firebase_admin.credentials')

# redis stub (needed by database.redis_db)
_stub('redis')
_stub('redis.asyncio')

# other transitive stubs
_stub('database.redis_db')
_stub('database._client')

from fastapi.testclient import TestClient
from fastapi import FastAPI

# ─── Build a minimal app with the router ─────────────────────

from routers.toki_voice_personas import router
from utils.other.endpoints import get_current_user_uid

TEST_UID = 'test_user_001'

app = FastAPI()
app.include_router(router)

# Override auth dependency so tests don't need Firebase tokens
app.dependency_overrides[get_current_user_uid] = lambda: TEST_UID

client = TestClient(app)

# ─── Fixture helpers ──────────────────────────────────────────

NOW = datetime.now(timezone.utc)


def make_cluster_doc(cluster_id: str = None, status: str = 'unknown', **kwargs) -> dict:
    cid = cluster_id or uuid.uuid4().hex
    return {
        'id': cid,
        'uid': TEST_UID,
        'status': status,
        'display_name': None,
        'person_id': None,
        'tags': [],
        'embeddings': [[0.1] * 4],
        'embedding_count': 1,
        'first_seen': NOW,
        'last_seen': NOW,
        'total_segments': 5,
        'total_duration_seconds': 30.0,
        'conversation_ids': ['c1', 'c2'],
        'sample_quotes': [],
        'audio_sample_url': None,
        'created_at': NOW,
        'updated_at': NOW,
        **kwargs,
    }


# ─── GET / ───────────────────────────────────────────────────

class TestListVoicePersonas:
    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_returns_list(self, mock_get):
        mock_get.return_value = [make_cluster_doc('c1'), make_cluster_doc('c2')]
        resp = client.get('/v1/toki/voice-personas/')
        assert resp.status_code == 200
        data = resp.json()
        assert len(data) == 2

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_empty_list(self, mock_get):
        mock_get.return_value = []
        resp = client.get('/v1/toki/voice-personas/')
        assert resp.status_code == 200
        assert resp.json() == []

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_default_status_is_unknown(self, mock_get):
        mock_get.return_value = []
        client.get('/v1/toki/voice-personas/')
        mock_get.assert_called_once_with(TEST_UID, status='unknown', limit=50)

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_named_status_filter(self, mock_get):
        mock_get.return_value = []
        client.get('/v1/toki/voice-personas/?status=named')
        mock_get.assert_called_once_with(TEST_UID, status='named', limit=50)

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_summary_fields_present(self, mock_get):
        mock_get.return_value = [make_cluster_doc('abc123')]
        resp = client.get('/v1/toki/voice-personas/')
        item = resp.json()[0]
        assert 'id' in item
        assert 'label' in item
        assert 'status' in item
        assert 'conversation_count' in item
        assert 'total_segments' in item


# ─── GET /{id} ───────────────────────────────────────────────

class TestGetVoicePersona:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_found(self, mock_get):
        mock_get.return_value = make_cluster_doc('abc123')
        resp = client.get('/v1/toki/voice-personas/abc123')
        assert resp.status_code == 200
        assert resp.json()['id'] == 'abc123'

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_not_found_404(self, mock_get):
        mock_get.return_value = None
        resp = client.get('/v1/toki/voice-personas/nonexistent')
        assert resp.status_code == 404

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_deleted_cluster_404(self, mock_get):
        mock_get.return_value = make_cluster_doc('abc', status='deleted')
        resp = client.get('/v1/toki/voice-personas/abc')
        assert resp.status_code == 404


# ─── GET /{id}/audio ─────────────────────────────────────────

class TestGetAudio:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_audio_url_returned(self, mock_get):
        url = 'gs://toki-profiles/clusters/abc123.wav'
        mock_get.return_value = make_cluster_doc('abc123', audio_sample_url=url)
        resp = client.get('/v1/toki/voice-personas/abc123/audio')
        assert resp.status_code == 200
        assert resp.json()['audio_sample_url'] == url

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_no_audio_404(self, mock_get):
        mock_get.return_value = make_cluster_doc('abc123', audio_sample_url=None)
        resp = client.get('/v1/toki/voice-personas/abc123/audio')
        assert resp.status_code == 404

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_cluster_not_found_404(self, mock_get):
        mock_get.return_value = None
        resp = client.get('/v1/toki/voice-personas/nope/audio')
        assert resp.status_code == 404


# ─── POST /{id}/name ─────────────────────────────────────────

class TestNameVoicePersona:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.assign_name_to_cluster')
    def test_name_assigned(self, mock_assign, mock_get):
        doc = make_cluster_doc('abc123')
        # First call: validate existence; second: fetch updated doc
        mock_get.side_effect = [doc, {**doc, 'display_name': 'Papa', 'status': 'named'}]
        resp = client.post('/v1/toki/voice-personas/abc123/name', json={'name': 'Papa'})
        assert resp.status_code == 200
        mock_assign.assert_called_once()

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_cluster_not_found_404(self, mock_get):
        mock_get.return_value = None
        resp = client.post('/v1/toki/voice-personas/nope/name', json={'name': 'Papa'})
        assert resp.status_code == 404

    def test_empty_name_422(self):
        resp = client.post('/v1/toki/voice-personas/abc/name', json={'name': ''})
        assert resp.status_code == 422

    def test_name_too_long_422(self):
        resp = client.post('/v1/toki/voice-personas/abc/name', json={'name': 'A' * 61})
        assert resp.status_code == 422

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.assign_name_to_cluster')
    def test_with_person_id(self, mock_assign, mock_get):
        doc = make_cluster_doc('abc123')
        updated = {**doc, 'display_name': 'Marie', 'status': 'named', 'person_id': 'p123'}
        mock_get.side_effect = [doc, updated]
        resp = client.post(
            '/v1/toki/voice-personas/abc123/name',
            json={'name': 'Marie', 'person_id': 'p123', 'tags': ['famille']},
        )
        assert resp.status_code == 200
        _, kwargs = mock_assign.call_args if mock_assign.call_args else (None, {})
        call_args = mock_assign.call_args[0]
        assert call_args[3] == 'p123'  # person_id was passed through


# ─── POST /{id}/merge/{other_id} ─────────────────────────────

class TestMergeVoicePersonas:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.merge_clusters')
    def test_merge_success(self, mock_merge, mock_get):
        target = make_cluster_doc('target')
        source = make_cluster_doc('source')
        merged = {**target, 'total_segments': 10}
        mock_get.side_effect = [target, source, merged]
        resp = client.post(
            '/v1/toki/voice-personas/target/merge/source',
            json={'keep_id': 'target'},
        )
        assert resp.status_code == 200
        mock_merge.assert_called_once_with(TEST_UID, source_id='source', target_id='target')

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_invalid_keep_id_422(self, mock_get):
        mock_get.side_effect = [make_cluster_doc('a'), make_cluster_doc('b')]
        resp = client.post(
            '/v1/toki/voice-personas/a/merge/b',
            json={'keep_id': 'completely_different'},
        )
        assert resp.status_code == 422

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_source_not_found_404(self, mock_get):
        mock_get.side_effect = [make_cluster_doc('target'), None]
        resp = client.post(
            '/v1/toki/voice-personas/target/merge/ghost',
            json={'keep_id': 'target'},
        )
        assert resp.status_code == 404


# ─── DELETE /{id} ────────────────────────────────────────────

class TestDeleteVoicePersona:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.delete_cluster')
    def test_delete_success(self, mock_delete, mock_get):
        mock_get.return_value = make_cluster_doc('abc123')
        resp = client.delete('/v1/toki/voice-personas/abc123')
        assert resp.status_code == 200
        assert resp.json()['status'] == 'deleted'
        assert resp.json()['id'] == 'abc123'
        mock_delete.assert_called_once_with(TEST_UID, 'abc123')

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_not_found_404(self, mock_get):
        mock_get.return_value = None
        resp = client.delete('/v1/toki/voice-personas/ghost')
        assert resp.status_code == 404

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.delete_cluster')
    def test_already_deleted_404(self, mock_delete, mock_get):
        mock_get.return_value = make_cluster_doc('abc', status='deleted')
        resp = client.delete('/v1/toki/voice-personas/abc')
        assert resp.status_code == 404
        mock_delete.assert_not_called()


# ─── GET /lookup ──────────────────────────────────────────────

class TestLookupCluster:
    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_found_matching_cluster(self, mock_get):
        doc = make_cluster_doc('abc', per_conversation_speakers={'conv1': ['SPEAKER_00', 'SPEAKER_01']})
        mock_get.return_value = [doc]
        resp = client.get('/v1/toki/voice-personas/lookup?conversation_id=conv1&speaker_id=SPEAKER_00')
        assert resp.status_code == 200
        assert resp.json()['id'] == 'abc'

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_not_found_wrong_speaker(self, mock_get):
        doc = make_cluster_doc('abc', per_conversation_speakers={'conv1': ['SPEAKER_00']})
        mock_get.return_value = [doc]
        resp = client.get('/v1/toki/voice-personas/lookup?conversation_id=conv1&speaker_id=SPEAKER_01')
        assert resp.status_code == 404

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_not_found_wrong_conversation(self, mock_get):
        doc = make_cluster_doc('abc', per_conversation_speakers={'conv1': ['SPEAKER_00']})
        mock_get.return_value = [doc]
        resp = client.get('/v1/toki/voice-personas/lookup?conversation_id=conv2&speaker_id=SPEAKER_00')
        assert resp.status_code == 404

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_no_clusters(self, mock_get):
        mock_get.return_value = []
        resp = client.get('/v1/toki/voice-personas/lookup?conversation_id=conv1&speaker_id=SPEAKER_00')
        assert resp.status_code == 404

    @patch('routers.toki_voice_personas.clusters_db.get_clusters_for_user')
    def test_missing_query_params(self, mock_get):
        mock_get.return_value = []
        resp = client.get('/v1/toki/voice-personas/lookup')
        assert resp.status_code == 422


# ─── POST /confirm-suggestion / reject-suggestion ─────────────

class TestSuggestionEndpoints:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.assign_name_to_cluster')
    @patch('routers.toki_voice_personas.clusters_db.clear_cluster_suggestion')
    def test_confirm_suggestion_success(self, mock_clear, mock_assign, mock_get):
        doc = make_cluster_doc('abc', suggestion_name='Papa', suggestion_person_id='p1')
        mock_get.return_value = doc
        resp = client.post('/v1/toki/voice-personas/abc/confirm-suggestion')
        assert resp.status_code == 200
        mock_assign.assert_called_once()
        mock_clear.assert_called_once()

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_confirm_no_suggestion_422(self, mock_get):
        mock_get.return_value = make_cluster_doc('abc')  # no suggestion_name
        resp = client.post('/v1/toki/voice-personas/abc/confirm-suggestion')
        assert resp.status_code == 422

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.clear_cluster_suggestion')
    def test_reject_suggestion_success(self, mock_clear, mock_get):
        mock_get.return_value = make_cluster_doc('abc', suggestion_name='Papa')
        resp = client.post('/v1/toki/voice-personas/abc/reject-suggestion')
        assert resp.status_code == 200
        mock_clear.assert_called_once_with(TEST_UID, 'abc')

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_reject_not_found_404(self, mock_get):
        mock_get.return_value = None
        resp = client.post('/v1/toki/voice-personas/xyz/reject-suggestion')
        assert resp.status_code == 404


# ─── GET /{id}/conversations ──────────────────────────────────

class TestListClusterConversations:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_returns_conversations(self, mock_get):
        from datetime import timezone
        import datetime as dt
        now = dt.datetime.now(timezone.utc)
        doc = make_cluster_doc(
            'abc',
            conversation_ids=['c1', 'c2'],
            sample_quotes=[
                {'text': 'hello', 'conversation_id': 'c1',
                 'timestamp': now.isoformat()},
            ],
        )
        mock_get.return_value = doc
        resp = client.get('/v1/toki/voice-personas/abc/conversations')
        assert resp.status_code == 200
        data = resp.json()
        assert len(data) == 2
        assert any(e['conversation_id'] == 'c1' for e in data)

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_not_found(self, mock_get):
        mock_get.return_value = None
        resp = client.get('/v1/toki/voice-personas/xyz/conversations')
        assert resp.status_code == 404


# ─── POST /{id}/split ─────────────────────────────────────────

class TestSplitVoicePersona:
    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    @patch('routers.toki_voice_personas.clusters_db.split_cluster')
    def test_split_success(self, mock_split, mock_get):
        original = make_cluster_doc('abc', conversation_ids=['c1', 'c2', 'c3'])
        new_cluster = make_cluster_doc('new_id', conversation_ids=['c1'])
        mock_get.side_effect = [original, new_cluster]
        mock_split.return_value = 'new_id'
        resp = client.post(
            '/v1/toki/voice-personas/abc/split',
            json={'conversation_ids': ['c1']},
        )
        assert resp.status_code == 200
        assert resp.json()['id'] == 'new_id'
        mock_split.assert_called_once_with(TEST_UID, 'abc', ['c1'])

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_invalid_conv_id_422(self, mock_get):
        mock_get.return_value = make_cluster_doc('abc', conversation_ids=['c1', 'c2'])
        resp = client.post(
            '/v1/toki/voice-personas/abc/split',
            json={'conversation_ids': ['c_unknown']},
        )
        assert resp.status_code == 422

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_all_convs_422(self, mock_get):
        mock_get.return_value = make_cluster_doc('abc', conversation_ids=['c1', 'c2'])
        resp = client.post(
            '/v1/toki/voice-personas/abc/split',
            json={'conversation_ids': ['c1', 'c2']},
        )
        assert resp.status_code == 422

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_not_found_404(self, mock_get):
        mock_get.return_value = None
        resp = client.post(
            '/v1/toki/voice-personas/xyz/split',
            json={'conversation_ids': ['c1']},
        )
        assert resp.status_code == 404

    @patch('routers.toki_voice_personas.clusters_db.get_cluster_by_id')
    def test_empty_body_422(self, mock_get):
        mock_get.return_value = make_cluster_doc('abc', conversation_ids=['c1'])
        resp = client.post(
            '/v1/toki/voice-personas/abc/split',
            json={'conversation_ids': []},
        )
        assert resp.status_code == 422
