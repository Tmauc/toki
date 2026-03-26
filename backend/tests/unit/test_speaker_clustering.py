"""
Unit tests for Toki — utils/speaker_clustering.py

Pure logic tests: no Firestore, no network, no embedding API.
"""

import math
from datetime import datetime, timezone
from typing import List
from unittest.mock import AsyncMock, MagicMock, patch

import numpy as np
import pytest

from utils.speaker_clustering import (
    CLUSTER_MATCH_THRESHOLD,
    DYNAMIC_THRESHOLD_MAX,
    DYNAMIC_THRESHOLD_MIN,
    SUGGESTION_THRESHOLD,
    WPS_CLEAR_LOWER,
    WPS_NOISY_UPPER,
    _compute_centroid,
    compute_cosine_distance,
    estimate_threshold_for_segment,
    extract_sample_quote,
    find_best_cluster_match,
    should_create_new_cluster,
)

# ─── Helpers ─────────────────────────────────────────────────

def unit_vec(dim: int, idx: int) -> List[float]:
    """Return a unit vector with 1.0 at position idx and 0 elsewhere."""
    v = [0.0] * dim
    v[idx] = 1.0
    return v


def uniform_vec(dim: int, value: float = 1.0) -> List[float]:
    """Return a vector of identical values, L2-normalised."""
    v = [value] * dim
    norm = math.sqrt(sum(x * x for x in v))
    return [x / norm for x in v]


def make_cluster(cluster_id: str, embeddings: List[List[float]], uid: str = 'u1') -> dict:
    """Minimal cluster dict suitable for find_best_cluster_match."""
    return {
        'id': cluster_id,
        'uid': uid,
        'status': 'unknown',
        'display_name': None,
        'person_id': None,
        'tags': [],
        'embeddings': embeddings,
        'embedding_count': len(embeddings),
        'first_seen': datetime.now(timezone.utc),
        'last_seen': datetime.now(timezone.utc),
        'total_segments': 1,
        'total_duration_seconds': 5.0,
        'conversation_ids': [],
        'sample_quotes': [],
        'audio_sample_url': None,
        'created_at': datetime.now(timezone.utc),
        'updated_at': datetime.now(timezone.utc),
    }


# ─── compute_cosine_distance ─────────────────────────────────

class TestComputeCosineDistance:
    def test_identical_vectors_are_zero(self):
        v = [1.0, 2.0, 3.0]
        assert compute_cosine_distance(v, v) == pytest.approx(0.0, abs=1e-6)

    def test_opposite_vectors_are_two(self):
        v = [1.0, 0.0]
        neg = [-1.0, 0.0]
        assert compute_cosine_distance(v, neg) == pytest.approx(2.0, abs=1e-6)

    def test_orthogonal_vectors_are_one(self):
        a = unit_vec(4, 0)
        b = unit_vec(4, 1)
        assert compute_cosine_distance(a, b) == pytest.approx(1.0, abs=1e-6)

    def test_zero_vector_returns_neutral(self):
        a = [0.0, 0.0, 0.0]
        b = [1.0, 2.0, 3.0]
        assert compute_cosine_distance(a, b) == 1.0

    def test_dimension_mismatch_returns_neutral(self):
        assert compute_cosine_distance([1.0, 2.0], [1.0, 2.0, 3.0]) == 1.0

    def test_high_dimensional_similar_vectors(self):
        a = uniform_vec(512, 1.0)
        b = uniform_vec(512, 1.0)  # identical direction
        assert compute_cosine_distance(a, b) == pytest.approx(0.0, abs=1e-5)

    def test_slightly_different_vectors_small_distance(self):
        a = [1.0, 0.0, 0.0]
        b = [0.99, 0.14, 0.0]  # ~8° apart
        dist = compute_cosine_distance(a, b)
        assert 0.0 < dist < 0.02

    def test_returns_float(self):
        result = compute_cosine_distance([1.0], [1.0])
        assert isinstance(result, float)


# ─── find_best_cluster_match ─────────────────────────────────

class TestFindBestClusterMatch:
    def test_empty_clusters_returns_none(self):
        emb = unit_vec(4, 0)
        result = find_best_cluster_match(emb, [])
        assert result is None

    def test_perfect_match_is_found(self):
        emb = unit_vec(4, 0)
        cluster = make_cluster('c1', [emb])
        result = find_best_cluster_match(emb, [cluster])
        assert result is not None
        cluster_id, distance = result
        assert cluster_id == 'c1'
        assert distance == pytest.approx(0.0, abs=1e-6)

    def test_orthogonal_embedding_returns_none(self):
        emb_a = unit_vec(4, 0)
        emb_b = unit_vec(4, 1)  # orthogonal → distance = 1.0
        cluster = make_cluster('c1', [emb_a])
        result = find_best_cluster_match(emb_b, [cluster], threshold=CLUSTER_MATCH_THRESHOLD)
        assert result is None

    def test_picks_closest_cluster(self):
        # c1 at dimension 0, c2 at dimension 1
        # Query is close to c1 but not c2
        close_emb = [0.99, 0.14, 0.0, 0.0]  # ~8° from unit(4,0)
        c1 = make_cluster('close', [unit_vec(4, 0)])
        c2 = make_cluster('far',   [unit_vec(4, 1)])
        result = find_best_cluster_match(close_emb, [c1, c2])
        assert result is not None
        assert result[0] == 'close'

    def test_cluster_without_embeddings_skipped(self):
        emb = unit_vec(4, 0)
        empty_cluster = make_cluster('empty', [])
        result = find_best_cluster_match(emb, [empty_cluster])
        assert result is None

    def test_uses_centroid_of_multiple_embeddings(self):
        # Two embeddings on opposite sides of dimension 0 → centroid is unit(4,0)
        e1 = [2.0, 0.0, 0.0, 0.0]
        e2 = [1.0, 0.0, 0.0, 0.0]
        cluster = make_cluster('c1', [e1, e2])
        query = unit_vec(4, 0)
        result = find_best_cluster_match(query, [cluster])
        assert result is not None
        assert result[0] == 'c1'

    def test_returns_tuple_of_str_and_float(self):
        emb = unit_vec(4, 0)
        cluster = make_cluster('c1', [emb])
        result = find_best_cluster_match(emb, [cluster])
        assert result is not None
        cid, dist = result
        assert isinstance(cid, str)
        assert isinstance(dist, float)

    def test_custom_threshold_respected(self):
        # distance ≈ 0.02 (close vectors) — should match with threshold=0.05, not with 0.01
        a = [1.0, 0.0]
        b = [0.98, 0.2]
        cluster = make_cluster('c1', [a])
        dist = compute_cosine_distance(b, a)

        result_pass = find_best_cluster_match(b, [cluster], threshold=dist + 0.01)
        assert result_pass is not None

        result_fail = find_best_cluster_match(b, [cluster], threshold=dist - 0.01)
        assert result_fail is None


# ─── should_create_new_cluster ───────────────────────────────

class TestShouldCreateNewCluster:
    def test_no_match_returns_true(self):
        assert should_create_new_cluster(None) is True

    def test_distance_above_threshold_returns_true(self):
        assert should_create_new_cluster(CLUSTER_MATCH_THRESHOLD + 0.01) is True

    def test_distance_at_threshold_returns_false(self):
        assert should_create_new_cluster(CLUSTER_MATCH_THRESHOLD) is False

    def test_distance_below_threshold_returns_false(self):
        assert should_create_new_cluster(CLUSTER_MATCH_THRESHOLD - 0.01) is False

    def test_zero_distance_returns_false(self):
        assert should_create_new_cluster(0.0) is False


# ─── extract_sample_quote ────────────────────────────────────

class TestExtractSampleQuote:
    def test_empty_string(self):
        assert extract_sample_quote('') == ''

    def test_short_text_unchanged(self):
        text = 'Bonjour comment ça va'
        assert extract_sample_quote(text) == text

    def test_exactly_30_words_unchanged(self):
        text = ' '.join(['mot'] * 30)
        assert extract_sample_quote(text) == text
        assert '…' not in extract_sample_quote(text)

    def test_31_words_truncated(self):
        text = ' '.join(['mot'] * 31)
        result = extract_sample_quote(text)
        assert result.endswith('…')
        # '…' is appended directly to the last word → split gives 30 elements
        assert len(result.split()) == 30

    def test_custom_max_words(self):
        text = 'a b c d e f'
        result = extract_sample_quote(text, max_words=3)
        assert result == 'a b c…'

    def test_strips_whitespace(self):
        text = '  hello world  '
        assert extract_sample_quote(text) == 'hello world'

    def test_none_safe(self):
        # Should not crash on empty string (callers may pass seg.get('text', ''))
        result = extract_sample_quote('')
        assert result == ''


# ─── Centroid ─────────────────────────────────────────────────

class TestComputeCentroid:
    def test_single_vector(self):
        embs = [[1.0, 0.0, 0.0]]
        assert _compute_centroid(embs) == [1.0, 0.0, 0.0]

    def test_two_vectors_mean(self):
        embs = [[1.0, 0.0], [0.0, 1.0]]
        result = _compute_centroid(embs)
        assert abs(result[0] - 0.5) < 1e-9
        assert abs(result[1] - 0.5) < 1e-9

    def test_empty_returns_none(self):
        assert _compute_centroid([]) is None

    def test_suggestion_threshold_is_tighter_than_cluster(self):
        assert SUGGESTION_THRESHOLD < CLUSTER_MATCH_THRESHOLD


# ─── Suggestion threshold logic ──────────────────────────────

class TestSuggestionThreshold:
    def test_threshold_is_tighter_than_cluster(self):
        assert SUGGESTION_THRESHOLD < CLUSTER_MATCH_THRESHOLD

    def test_identical_vectors_below_suggestion_threshold(self):
        v = uniform_vec(4)
        dist = compute_cosine_distance(v, v)
        assert dist < SUGGESTION_THRESHOLD

    def test_orthogonal_vectors_above_suggestion_threshold(self):
        a = unit_vec(4, 0)
        b = unit_vec(4, 1)
        dist = compute_cosine_distance(a, b)
        assert dist > SUGGESTION_THRESHOLD

    def test_dissimilar_vectors_not_suggested(self):
        # unit vectors in different directions have distance 1.0 — well above threshold
        a = unit_vec(4, 0)  # [1, 0, 0, 0]
        b = unit_vec(4, 2)  # [0, 0, 1, 0]
        dist = compute_cosine_distance(a, b)
        assert dist > SUGGESTION_THRESHOLD


# ─── Dynamic threshold ────────────────────────────────────────

class TestEstimateThresholdForSegment:
    def _seg(self, text: str, start: float, end: float) -> dict:
        return {'text': text, 'start': start, 'end': end}

    def test_normal_speech_returns_base(self):
        # ~1.5 wps — between WPS_NOISY_UPPER and WPS_CLEAR_LOWER
        seg = self._seg('un deux trois quatre cinq six', 0.0, 4.0)  # 6 words / 4s = 1.5 wps
        result = estimate_threshold_for_segment(seg)
        assert result == CLUSTER_MATCH_THRESHOLD

    def test_noisy_raises_threshold(self):
        # 0.3 wps — below WPS_NOISY_UPPER (0.8)
        seg = self._seg('un deux', 0.0, 7.0)  # 2 words / 7s ≈ 0.29 wps
        result = estimate_threshold_for_segment(seg)
        assert result > CLUSTER_MATCH_THRESHOLD
        assert result <= DYNAMIC_THRESHOLD_MAX

    def test_clear_speech_lowers_threshold(self):
        # 3.5 wps — above WPS_CLEAR_LOWER (2.5)
        seg = self._seg('un deux trois quatre cinq six sept', 0.0, 2.0)  # 7 / 2 = 3.5 wps
        result = estimate_threshold_for_segment(seg)
        assert result < CLUSTER_MATCH_THRESHOLD
        assert result >= DYNAMIC_THRESHOLD_MIN

    def test_empty_text_treated_as_noisy(self):
        # 0 words → 0 wps → noisy multiplier
        seg = self._seg('', 0.0, 2.0)
        result = estimate_threshold_for_segment(seg)
        assert result > CLUSTER_MATCH_THRESHOLD

    def test_custom_base_threshold(self):
        seg = self._seg('un deux', 0.0, 7.0)  # noisy
        base = 0.20
        result = estimate_threshold_for_segment(seg, base_threshold=base)
        assert result > base

    def test_result_clamped_to_max(self):
        # Extremely low WPS should not exceed DYNAMIC_THRESHOLD_MAX
        seg = self._seg('un', 0.0, 100.0)  # 0.01 wps
        result = estimate_threshold_for_segment(seg)
        assert result <= DYNAMIC_THRESHOLD_MAX

    def test_result_clamped_to_min(self):
        # Very high WPS with very tight base should not go below DYNAMIC_THRESHOLD_MIN
        seg = self._seg(' '.join(['x'] * 30), 0.0, 1.0)  # 30 wps
        result = estimate_threshold_for_segment(seg, base_threshold=0.15)
        assert result >= DYNAMIC_THRESHOLD_MIN

    def test_missing_timing_uses_fallback(self):
        # No start/end keys — should not crash
        seg = {'text': 'hello world', 'abs_start': 0.0, 'abs_end': 3.0}
        result = estimate_threshold_for_segment(seg)
        assert DYNAMIC_THRESHOLD_MIN <= result <= DYNAMIC_THRESHOLD_MAX
