"""
Unit tests for Toki — utils/toki_retroactive.py

Tests the retroactive update logic with mocked DB/Pinecone/notification calls.
"""

import asyncio
from unittest.mock import AsyncMock, MagicMock, patch, call
from datetime import datetime, timezone

import pytest
import sys

# ─── Stub heavy dependencies ─────────────────────────────────

def _stub(name):
    m = MagicMock()
    sys.modules.setdefault(name, m)
    return m

_stub('google')
_stub('google.cloud')
gf1 = _stub('google.cloud.firestore_v1')
gf1.FieldFilter = MagicMock
_stub('firebase_admin')
_stub('firebase_admin.auth')
_stub('redis')
_stub('redis.asyncio')
_stub('database.redis_db')

# Stub database._client with a real db attribute so lazy imports work
_client_mod = _stub('database._client')
_client_mod.db = MagicMock()

_stub('pinecone')

# Stub utils.notifications so the lazy import inside _send_naming_notification works
_notif_mod = _stub('utils.notifications')
_notif_mod.send_notification = MagicMock()

# Stub database.vector_db so the lazy import of `index` works
_vdb_mod = _stub('database.vector_db')
_vdb_mod.index = MagicMock()

from utils.toki_retroactive import (
    run_retroactive_update,
    _batch_update_firestore_segments,
    _update_pinecone_metadata,
    _send_naming_notification,
)

# ─── Helpers ─────────────────────────────────────────────────

UID = 'user_test'
CLUSTER_ID = 'cluster_abc'
PERSON_ID = 'person_xyz'
PERSON_NAME = 'Papa'
NOW = datetime.now(timezone.utc)

FAKE_CLUSTER = {
    'id': CLUSTER_ID,
    'uid': UID,
    'status': 'named',
    'conversation_ids': ['conv_1', 'conv_2', 'conv_3'],
    'per_conversation_speakers': {
        'conv_1': [0],
        'conv_2': [1],
    },
    'embeddings': [],
    'embedding_count': 0,
    'first_seen': NOW,
    'last_seen': NOW,
    'total_segments': 10,
    'total_duration_seconds': 60.0,
    'display_name': PERSON_NAME,
    'person_id': PERSON_ID,
    'tags': [],
    'sample_quotes': [],
    'audio_sample_url': None,
    'created_at': NOW,
    'updated_at': NOW,
}


# ─── run_retroactive_update ──────────────────────────────────

class TestRunRetroactiveUpdate:
    @patch('utils.toki_retroactive._send_naming_notification')
    @patch('utils.toki_retroactive._update_pinecone_metadata')
    @patch('utils.toki_retroactive._batch_update_firestore_segments')
    @patch('database.unknown_speakers.get_cluster_by_id')
    def test_full_pipeline_runs(self, mock_get, mock_fs, mock_pin, mock_notif):
        mock_get.return_value = FAKE_CLUSTER
        mock_fs.return_value = (2, 5)
        mock_pin.return_value = 3
        mock_notif.return_value = True

        summary = asyncio.run(run_retroactive_update(UID, CLUSTER_ID, PERSON_ID, PERSON_NAME))

        assert summary['conversations_total'] == 3
        assert summary['conversations_firestore_updated'] == 2
        assert summary['segments_tagged'] == 5
        assert summary['conversations_pinecone_updated'] == 3
        assert summary['notification_sent'] is True
        assert summary['errors'] == []

    @patch('database.unknown_speakers.get_cluster_by_id')
    def test_cluster_not_found_returns_empty_summary(self, mock_get):
        mock_get.return_value = None
        summary = asyncio.run(run_retroactive_update(UID, CLUSTER_ID, PERSON_ID, PERSON_NAME))
        assert summary['conversations_total'] == 0
        assert summary['notification_sent'] is False

    @patch('utils.toki_retroactive._send_naming_notification')
    @patch('utils.toki_retroactive._update_pinecone_metadata')
    @patch('utils.toki_retroactive._batch_update_firestore_segments')
    @patch('database.unknown_speakers.get_cluster_by_id')
    def test_empty_conversation_list(self, mock_get, mock_fs, mock_pin, mock_notif):
        cluster = {**FAKE_CLUSTER, 'conversation_ids': []}
        mock_get.return_value = cluster
        mock_fs.return_value = (0, 0)
        mock_pin.return_value = 0
        mock_notif.return_value = True

        summary = asyncio.run(run_retroactive_update(UID, CLUSTER_ID, PERSON_ID, PERSON_NAME))
        assert summary['conversations_total'] == 0


# ─── _batch_update_firestore_segments ────────────────────────

class TestBatchUpdateFirestoreSegments:
    def _make_conv_snap(self, conv_id: str, segments: list, exists: bool = True):
        snap = MagicMock()
        snap.exists = exists
        snap.to_dict.return_value = {'transcript_segments': segments}
        return snap

    def _make_db_mock(self, snap):
        mock_db = MagicMock()
        conv_ref = MagicMock()
        conv_ref.get.return_value = snap
        (mock_db.collection.return_value
                .document.return_value
                .collection.return_value
                .document.return_value) = conv_ref
        return mock_db, conv_ref

    def test_tags_matching_segments(self):
        segments = [
            {'id': 's1', 'speaker_id': 0, 'text': 'hello'},
            {'id': 's2', 'speaker_id': 1, 'text': 'world'},
        ]
        snap = self._make_conv_snap('conv_1', segments)
        mock_db, _ = self._make_db_mock(snap)

        with patch('database._client.db', mock_db):
            conv_updated, seg_tagged = _batch_update_firestore_segments(
                UID, ['conv_1'], {'conv_1': [0]}, PERSON_ID, [],
            )

        assert seg_tagged == 1
        assert conv_updated == 1
        assert segments[0]['person_id'] == PERSON_ID
        assert 'person_id' not in segments[1]

    def test_skips_conversation_without_speaker_mapping(self):
        conv_updated, seg_tagged = _batch_update_firestore_segments(
            UID, ['conv_no_mapping'], {}, PERSON_ID, [],
        )
        assert conv_updated == 0
        assert seg_tagged == 0

    def test_skips_already_tagged_segments(self):
        segments = [{'id': 's1', 'speaker_id': 0, 'text': 'hi', 'person_id': 'other'}]
        snap = self._make_conv_snap('conv_1', segments)
        mock_db, _ = self._make_db_mock(snap)

        with patch('database._client.db', mock_db):
            conv_updated, seg_tagged = _batch_update_firestore_segments(
                UID, ['conv_1'], {'conv_1': [0]}, PERSON_ID, [],
            )

        assert seg_tagged == 0
        assert conv_updated == 0

    def test_error_is_collected_not_raised(self):
        mock_db = MagicMock()
        conv_ref = MagicMock()
        conv_ref.get.side_effect = Exception('Firestore exploded')
        (mock_db.collection.return_value.document.return_value
                .collection.return_value.document.return_value) = conv_ref

        errors = []
        with patch('database._client.db', mock_db):
            conv_updated, seg_tagged = _batch_update_firestore_segments(
                UID, ['conv_err'], {'conv_err': [0]}, PERSON_ID, errors,
            )

        assert len(errors) == 1
        assert 'Firestore exploded' in errors[0]


# ─── _update_pinecone_metadata ───────────────────────────────

class TestUpdatePineconeMetadata:
    def test_adds_person_to_people_mentioned(self):
        mock_index = MagicMock()
        mock_index.fetch.return_value = {
            'vectors': {f'{UID}-conv_1': {'metadata': {'people_mentioned': ['Marie']}}}
        }
        with patch('database.vector_db.index', mock_index):
            updated = _update_pinecone_metadata(UID, ['conv_1'], 'Papa', [])
        assert updated == 1
        update_kwargs = mock_index.update.call_args[1]
        assert 'Papa' in update_kwargs['set_metadata']['people_mentioned']
        assert 'Marie' in update_kwargs['set_metadata']['people_mentioned']

    def test_skips_if_already_present(self):
        mock_index = MagicMock()
        mock_index.fetch.return_value = {
            'vectors': {f'{UID}-conv_1': {'metadata': {'people_mentioned': ['Papa']}}}
        }
        with patch('database.vector_db.index', mock_index):
            updated = _update_pinecone_metadata(UID, ['conv_1'], 'Papa', [])
        assert updated == 0
        mock_index.update.assert_not_called()

    def test_skips_if_vector_not_found(self):
        mock_index = MagicMock()
        mock_index.fetch.return_value = {'vectors': {}}
        with patch('database.vector_db.index', mock_index):
            updated = _update_pinecone_metadata(UID, ['conv_1'], 'Papa', [])
        assert updated == 0

    def test_error_collected_not_raised(self):
        mock_index = MagicMock()
        mock_index.fetch.side_effect = Exception('Pinecone down')
        errors = []
        with patch('database.vector_db.index', mock_index):
            updated = _update_pinecone_metadata(UID, ['conv_1'], 'Papa', errors)
        assert updated == 0
        assert len(errors) == 1

    def test_no_index_returns_zero(self):
        with patch('database.vector_db.index', None):
            updated = _update_pinecone_metadata(UID, ['conv_1'], 'Papa', [])
        assert updated == 0


# ─── _send_naming_notification ───────────────────────────────

class TestSendNamingNotification:
    def test_singular_message(self):
        mock_send = MagicMock()
        sys.modules['utils.notifications'].send_notification = mock_send
        result = _send_naming_notification(UID, 'Papa', 1, [])
        assert result is True
        mock_send.assert_called_once()
        body = mock_send.call_args[1]['body']
        assert '1 conversation' in body

    def test_plural_message(self):
        mock_send = MagicMock()
        sys.modules['utils.notifications'].send_notification = mock_send
        result = _send_naming_notification(UID, 'Papa', 5, [])
        assert result is True
        body = mock_send.call_args[1]['body']
        assert '5 conversations' in body

    def test_error_collected_returns_false(self):
        sys.modules['utils.notifications'].send_notification = MagicMock(
            side_effect=Exception('FCM error')
        )
        errors = []
        result = _send_naming_notification(UID, 'Papa', 3, errors)
        assert result is False
        assert len(errors) == 1
