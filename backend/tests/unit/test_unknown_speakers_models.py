"""
Unit tests for Toki Voice Personas — models/unknown_speakers.py

All tests are pure Pydantic (no Firestore dependency).
"""

from datetime import datetime, timezone

import pytest
from pydantic import ValidationError

from models.unknown_speakers import (
    ClusterStatus,
    ClusterSummary,
    MergeRequest,
    NamingRequest,
    PersonTag,
    SampleQuote,
    UnknownSpeakerCluster,
    UnknownSpeakerClusterDB,
)

# ─── Fixtures ────────────────────────────────────────────────

NOW = datetime.now(timezone.utc)
EMBEDDING_512 = [0.1] * 512


def make_cluster(**overrides) -> UnknownSpeakerCluster:
    defaults = dict(uid='user_abc')
    defaults.update(overrides)
    return UnknownSpeakerCluster(**defaults)


def make_cluster_db(**overrides) -> UnknownSpeakerClusterDB:
    defaults = dict(uid='user_abc', id='clust_0001')
    defaults.update(overrides)
    return UnknownSpeakerClusterDB(**defaults)


# ─── ClusterStatus ───────────────────────────────────────────

class TestClusterStatus:
    def test_valid_values(self):
        assert ClusterStatus.unknown == 'unknown'
        assert ClusterStatus.named == 'named'
        assert ClusterStatus.deleted == 'deleted'

    def test_invalid_value_raises(self):
        with pytest.raises(ValidationError):
            UnknownSpeakerCluster(uid='u', status='ghost')


# ─── PersonTag ───────────────────────────────────────────────

class TestPersonTag:
    def test_all_tags_valid(self):
        tags = ['famille', 'ami', 'collegue', 'connaissance', 'autre']
        for t in tags:
            assert PersonTag(t) == t

    def test_invalid_tag(self):
        with pytest.raises(ValueError):
            PersonTag('ennemi')


# ─── SampleQuote ─────────────────────────────────────────────

class TestSampleQuote:
    def test_valid_quote(self):
        q = SampleQuote(text='Hello world', conversation_id='conv_1', timestamp=NOW)
        assert q.text == 'Hello world'
        assert q.conversation_id == 'conv_1'

    def test_missing_field_raises(self):
        with pytest.raises(ValidationError):
            SampleQuote(text='oops')  # missing conversation_id + timestamp


# ─── UnknownSpeakerCluster ───────────────────────────────────

class TestUnknownSpeakerCluster:
    def test_defaults(self):
        c = make_cluster()
        assert c.status == ClusterStatus.unknown
        assert c.display_name is None
        assert c.person_id is None
        assert c.embeddings == []
        assert c.embedding_count == 0
        assert c.total_segments == 0
        assert c.total_duration_seconds == 0.0
        assert c.conversation_ids == []
        assert c.sample_quotes == []
        assert c.tags == []

    def test_uid_required(self):
        with pytest.raises(ValidationError):
            UnknownSpeakerCluster()

    # ── add_conversation ──

    def test_add_conversation_once(self):
        c = make_cluster()
        c.add_conversation('conv_1')
        assert 'conv_1' in c.conversation_ids

    def test_add_conversation_dedup(self):
        c = make_cluster()
        c.add_conversation('conv_1')
        c.add_conversation('conv_1')
        assert c.conversation_ids.count('conv_1') == 1

    def test_add_multiple_conversations(self):
        c = make_cluster()
        for i in range(5):
            c.add_conversation(f'conv_{i}')
        assert len(c.conversation_ids) == 5

    # ── add_embedding ──

    def test_add_embedding_updates_count(self):
        c = make_cluster()
        c.add_embedding(EMBEDDING_512)
        assert c.embedding_count == 1
        assert len(c.embeddings) == 1

    def test_add_embedding_caps_at_10(self):
        c = make_cluster()
        for i in range(15):
            c.add_embedding([float(i)] * 512)
        assert len(c.embeddings) == 10
        assert c.embedding_count == 10
        # Should keep the most recent ones (last 10)
        assert c.embeddings[0][0] == 5.0  # 15 added, kept last 10 → index 0 = item 5

    def test_add_embedding_exactly_10_no_drop(self):
        c = make_cluster()
        for i in range(10):
            c.add_embedding([float(i)] * 512)
        assert len(c.embeddings) == 10

    # ── get_centroid ──

    def test_centroid_empty_returns_none(self):
        c = make_cluster()
        assert c.get_centroid() is None

    def test_centroid_single_embedding(self):
        c = make_cluster()
        emb = [1.0, 2.0, 3.0]
        c.add_embedding(emb)
        centroid = c.get_centroid()
        assert centroid == [1.0, 2.0, 3.0]

    def test_centroid_multiple_embeddings(self):
        c = make_cluster()
        c.add_embedding([1.0, 0.0])
        c.add_embedding([3.0, 4.0])
        centroid = c.get_centroid()
        assert centroid == [2.0, 2.0]

    def test_centroid_length_matches_dimension(self):
        c = make_cluster()
        c.add_embedding(EMBEDDING_512)
        centroid = c.get_centroid()
        assert len(centroid) == 512

    # ── label property ──

    def test_label_no_display_name_no_id(self):
        c = make_cluster()
        assert c.label == 'Inconnu'

    def test_sample_quotes_max_length(self):
        quotes = [
            SampleQuote(text=f'Quote {i}', conversation_id='c', timestamp=NOW)
            for i in range(5)
        ]
        c = make_cluster(sample_quotes=quotes)
        assert len(c.sample_quotes) == 5


# ─── UnknownSpeakerClusterDB ─────────────────────────────────

class TestUnknownSpeakerClusterDB:
    def test_requires_id(self):
        with pytest.raises(ValidationError):
            UnknownSpeakerClusterDB(uid='u')

    def test_label_unknown(self):
        c = make_cluster_db(id='abcd1234')
        assert c.label == 'Inconnu #ABCD'

    def test_label_named(self):
        c = make_cluster_db(display_name='Papa')
        assert c.label == 'Papa'

    def test_id_preserved(self):
        c = make_cluster_db(id='xyz99')
        assert c.id == 'xyz99'

    def test_inherits_cluster_methods(self):
        c = make_cluster_db()
        c.add_embedding(EMBEDDING_512)
        assert c.embedding_count == 1
        assert c.get_centroid() is not None


# ─── NamingRequest ───────────────────────────────────────────

class TestNamingRequest:
    def test_valid_minimal(self):
        req = NamingRequest(name='Papa')
        assert req.name == 'Papa'
        assert req.person_id is None
        assert req.tags == []

    def test_with_person_id_and_tags(self):
        req = NamingRequest(name='Marie', person_id='person_xyz', tags=[PersonTag.famille])
        assert req.person_id == 'person_xyz'
        assert PersonTag.famille in req.tags

    def test_name_too_short_raises(self):
        with pytest.raises(ValidationError):
            NamingRequest(name='')

    def test_name_too_long_raises(self):
        with pytest.raises(ValidationError):
            NamingRequest(name='A' * 61)

    def test_name_max_length_ok(self):
        req = NamingRequest(name='A' * 60)
        assert len(req.name) == 60


# ─── MergeRequest ────────────────────────────────────────────

class TestMergeRequest:
    def test_valid(self):
        req = MergeRequest(keep_id='cluster_abc')
        assert req.keep_id == 'cluster_abc'

    def test_missing_keep_id_raises(self):
        with pytest.raises(ValidationError):
            MergeRequest()


# ─── ClusterSummary ──────────────────────────────────────────

class TestClusterSummary:
    def make_db_cluster(self, **kwargs) -> UnknownSpeakerClusterDB:
        defaults = dict(
            id='abc123',
            uid='user_1',
            total_segments=10,
            total_duration_seconds=45.5,
            first_seen=NOW,
            last_seen=NOW,
        )
        defaults.update(kwargs)
        return UnknownSpeakerClusterDB(**defaults)

    def test_from_db_basic(self):
        cluster = self.make_db_cluster()
        summary = ClusterSummary.from_db(cluster)
        assert summary.id == 'abc123'
        assert summary.label == 'Inconnu #ABC1'
        assert summary.status == ClusterStatus.unknown
        assert summary.total_segments == 10
        assert summary.total_duration_seconds == 45.5
        assert summary.conversation_count == 0

    def test_from_db_conversation_count(self):
        cluster = self.make_db_cluster(conversation_ids=['c1', 'c2', 'c3'])
        summary = ClusterSummary.from_db(cluster)
        assert summary.conversation_count == 3

    def test_from_db_sample_quotes_capped_at_3(self):
        quotes = [
            SampleQuote(text=f'Q{i}', conversation_id='c', timestamp=NOW)
            for i in range(5)
        ]
        cluster = self.make_db_cluster(sample_quotes=quotes)
        summary = ClusterSummary.from_db(cluster)
        assert len(summary.sample_quotes) == 3

    def test_from_db_named_cluster(self):
        cluster = self.make_db_cluster(display_name='Maman', status=ClusterStatus.named)
        summary = ClusterSummary.from_db(cluster)
        assert summary.label == 'Maman'
        assert summary.status == ClusterStatus.named

    def test_from_db_tags_forwarded(self):
        cluster = self.make_db_cluster(tags=[PersonTag.famille, PersonTag.ami])
        summary = ClusterSummary.from_db(cluster)
        assert PersonTag.famille in summary.tags
        assert PersonTag.ami in summary.tags

    def test_from_db_audio_url_forwarded(self):
        url = 'gs://toki-profiles/clusters/abc123.wav'
        cluster = self.make_db_cluster(audio_sample_url=url)
        summary = ClusterSummary.from_db(cluster)
        assert summary.audio_sample_url == url
