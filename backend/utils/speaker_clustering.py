"""
TOKI — Unknown speaker clustering utilities.

When a voice segment cannot be matched to a known person in people/{id},
this module routes it to the correct unknown-speaker cluster (or creates one).

Convention: cosine DISTANCE (same as the rest of the codebase — scipy cdist metric='cosine')
  0.0 = identical vectors, 2.0 = opposite vectors.

Thresholds (cosine distance):
  CLUSTER_MATCH_THRESHOLD  = 0.25   → cosine similarity > 0.75  (cluster match)
  CLUSTER_CREATE_THRESHOLD = 0.25   → same — no match → new cluster

Rationale for 0.25: tighter than the known-person threshold (0.45) because we
want to avoid polluting a cluster with different speakers.
"""

import asyncio
import logging
from datetime import datetime, timezone
from typing import Any, List, Optional, Tuple

import numpy as np
from scipy.spatial.distance import cosine as _scipy_cosine

# database and models are imported lazily inside functions to avoid hard
# google-cloud dependency at import time (makes unit tests easier to run).
# They are resolved at call time, so there is no runtime cost difference.

logger = logging.getLogger(__name__)

# ──────────────────────────────────────────────────────────────
# Thresholds
# ──────────────────────────────────────────────────────────────

# Cosine distance below which a segment is assigned to an existing cluster
CLUSTER_MATCH_THRESHOLD: float = 0.25

# Maximum number of embeddings kept per cluster (caps storage)
MAX_EMBEDDINGS_PER_CLUSTER: int = 10

# Maximum words in a sample quote
SAMPLE_QUOTE_MAX_WORDS: int = 30

# Cosine distance below which we suggest "Is this X?" to the user.
# 0.18 ≈ cosine similarity > 0.82 — very strong match.
SUGGESTION_THRESHOLD: float = 0.18

# Minimum embeddings before attempting a suggestion (need enough signal)
SUGGESTION_MIN_EMBEDDINGS: int = 2

# ── Dynamic threshold (noise adaptation) ──────────────────────
# Words-per-second thresholds for audio quality estimation
WPS_NOISY_UPPER: float = 0.8   # below → noisy / mumbled audio
WPS_CLEAR_LOWER: float = 2.5   # above → clear fast speech

# Multipliers applied to CLUSTER_MATCH_THRESHOLD
NOISY_THRESHOLD_MULTIPLIER: float = 1.4   # more lenient in noisy env
CLEAR_THRESHOLD_MULTIPLIER: float = 0.9   # slightly tighter for clean audio

# Hard caps to keep thresholds in a sensible range
DYNAMIC_THRESHOLD_MAX: float = 0.50
DYNAMIC_THRESHOLD_MIN: float = 0.15


# ──────────────────────────────────────────────────────────────
# Core math
# ──────────────────────────────────────────────────────────────

def estimate_threshold_for_segment(
    segment: dict,
    base_threshold: float = CLUSTER_MATCH_THRESHOLD,
) -> float:
    """
    Adjust the cluster-matching threshold based on estimated audio quality.

    Uses words-per-second (WPS) as a proxy for signal quality:
      - Low WPS  → noisy/mumbled → raise threshold (more lenient)
      - Normal WPS → return base_threshold unchanged
      - High WPS → clear speech   → lower threshold (tighter)

    The result is clamped to [DYNAMIC_THRESHOLD_MIN, DYNAMIC_THRESHOLD_MAX].
    """
    text = (segment.get('text') or '').strip()
    word_count = len(text.split()) if text else 0

    start = float(segment.get('start') or segment.get('abs_start') or 0.0)
    end   = float(segment.get('end')   or segment.get('abs_end')   or 0.0)
    duration = max(end - start, 0.1)   # avoid division by zero

    wps = word_count / duration

    if wps < WPS_NOISY_UPPER:
        adjusted = base_threshold * NOISY_THRESHOLD_MULTIPLIER
    elif wps > WPS_CLEAR_LOWER:
        adjusted = base_threshold * CLEAR_THRESHOLD_MULTIPLIER
    else:
        return base_threshold

    return max(DYNAMIC_THRESHOLD_MIN, min(DYNAMIC_THRESHOLD_MAX, adjusted))


def compute_cosine_distance(a: List[float], b: List[float]) -> float:
    """
    Cosine distance between two 1-D float vectors.
    Returns 0.0 for identical, 2.0 for opposite.
    Gracefully returns 1.0 (neutral) on zero-vector or dimension mismatch.
    """
    try:
        va = np.array(a, dtype=np.float32)
        vb = np.array(b, dtype=np.float32)
        if va.shape != vb.shape or va.ndim != 1:
            return 1.0
        norm_a = np.linalg.norm(va)
        norm_b = np.linalg.norm(vb)
        if norm_a == 0 or norm_b == 0:
            return 1.0
        return float(_scipy_cosine(va, vb))
    except Exception:
        return 1.0


def find_best_cluster_match(
    embedding: List[float],
    clusters: List[dict],
    threshold: float = CLUSTER_MATCH_THRESHOLD,
) -> Optional[Tuple[str, float]]:
    """
    Find the closest cluster whose centroid is within `threshold` cosine distance.

    Args:
        embedding: 1-D float list (query vector)
        clusters:  List of Firestore cluster dicts (must have 'id' and 'embeddings')
        threshold: Maximum cosine distance to count as a match

    Returns:
        (cluster_id, distance) of the best match, or None if nothing is close enough.
    """
    best_id: Optional[str] = None
    best_distance = float('inf')

    from models.unknown_speakers import UnknownSpeakerClusterDB  # lazy import

    for cluster in clusters:
        cluster_embeddings = cluster.get('embeddings', [])
        if not cluster_embeddings:
            continue

        # Reconstruct the model to use its centroid logic
        try:
            cluster_obj = UnknownSpeakerClusterDB(**cluster)
        except Exception as e:
            logger.warning(f'find_best_cluster_match: skipping malformed cluster {cluster.get("id")}: {e}')
            continue

        centroid = cluster_obj.get_centroid()
        if centroid is None:
            continue

        distance = compute_cosine_distance(embedding, centroid)
        if distance < best_distance:
            best_distance = distance
            best_id = cluster['id']

    if best_id is not None and best_distance <= threshold:
        return best_id, best_distance

    return None


def should_create_new_cluster(best_distance: Optional[float], threshold: float = CLUSTER_MATCH_THRESHOLD) -> bool:
    """Return True when no cluster is close enough and a new one should be created."""
    if best_distance is None:
        return True
    return best_distance > threshold


# ──────────────────────────────────────────────────────────────
# Quote helpers
# ──────────────────────────────────────────────────────────────

def extract_sample_quote(text: str, max_words: int = SAMPLE_QUOTE_MAX_WORDS) -> str:
    """Trim text to at most `max_words` words, appending '…' if truncated."""
    if not text:
        return ''
    words = text.split()
    if len(words) <= max_words:
        return text.strip()
    return ' '.join(words[:max_words]) + '…'


def _build_sample_quote(segment: dict, conversation_id: str) -> 'Optional[Any]':
    from models.unknown_speakers import SampleQuote  # lazy import
    """Build a SampleQuote from a transcript segment dict, or None if text is empty."""
    text = segment.get('text', '').strip()
    if not text:
        return None

    # Prefer abs_start (epoch float) for timestamp; fall back to 'start' (relative seconds)
    abs_start = segment.get('abs_start') or segment.get('start')
    if abs_start is not None:
        try:
            ts = datetime.fromtimestamp(float(abs_start), tz=timezone.utc)
        except (ValueError, OSError):
            ts = datetime.now(timezone.utc)
    else:
        ts = datetime.now(timezone.utc)

    return SampleQuote(
        text=extract_sample_quote(text),
        conversation_id=conversation_id,
        timestamp=ts,
    )


# ──────────────────────────────────────────────────────────────
# Main entry point (called from transcribe.py)
# ──────────────────────────────────────────────────────────────

async def route_unknown_segment(
    uid: str,
    embedding: np.ndarray,
    segment: dict,
    conversation_id: str,
    session_id: str = '',
    speaker_id: Optional[int] = None,
) -> Optional[str]:
    """
    Called when a speaker segment has no match in known people.
    Finds or creates an unknown-speaker cluster and updates it.

    Args:
        uid:             User ID
        embedding:       numpy array of shape (1, D) from extract_embedding_from_bytes
        segment:         Transcript segment dict (keys: id, text, abs_start, abs_end, duration, ...)
        conversation_id: Current conversation ID
        session_id:      Session ID for logging

    Returns:
        The cluster_id that was matched or created (for debugging/logging).
    """
    try:
        import database.unknown_speakers as clusters_db  # lazy import

        # Flatten numpy embedding to plain Python list
        emb_list: List[float] = embedding.flatten().tolist()

        # Load all active clusters with their embeddings
        existing = await asyncio.to_thread(clusters_db.get_clusters_with_embeddings, uid)

        # Dynamic threshold: relax in noisy / tighten in clean environments
        threshold = estimate_threshold_for_segment(segment)
        match = find_best_cluster_match(emb_list, existing, threshold=threshold)

        # Resolve speaker_id from segment dict if not explicitly passed
        spk_id = speaker_id if speaker_id is not None else segment.get('speaker_id')

        if match:
            cluster_id, distance = match
            logger.info(
                f'[TOKI] speaker_clustering: matched cluster {cluster_id} '
                f'(dist={distance:.3f}) {uid} {session_id}'
            )
            await _update_existing_cluster(uid, cluster_id, emb_list, segment, conversation_id, spk_id)
        else:
            cluster_id = await _create_new_cluster(uid, emb_list, segment, conversation_id, spk_id)
            logger.info(
                f'[TOKI] speaker_clustering: new cluster {cluster_id} created {uid} {session_id}'
            )

        # Fire-and-forget suggestion check once we have enough embeddings
        cluster_data = await asyncio.to_thread(clusters_db.get_cluster_by_id, uid, cluster_id)
        if cluster_data:
            current_count = cluster_data.get('embedding_count', 0)
            if current_count >= SUGGESTION_MIN_EMBEDDINGS:
                centroid = _compute_centroid(cluster_data.get('embeddings', []))
                if centroid:
                    asyncio.create_task(
                        _maybe_update_suggestion(uid, cluster_id, centroid)
                    )

        return cluster_id

    except Exception as e:
        logger.error(f'[TOKI] speaker_clustering: error for uid={uid} conv={conversation_id}: {e}')
        return None


# ──────────────────────────────────────────────────────────────
# Internal helpers
# ──────────────────────────────────────────────────────────────

async def _update_existing_cluster(
    uid: str,
    cluster_id: str,
    emb_list: List[float],
    segment: dict,
    conversation_id: str,
    speaker_id: Optional[int] = None,
) -> None:
    """Add a new embedding + conversation reference to an existing cluster."""

    # 1. Fetch current embeddings, append new one (cap at MAX_EMBEDDINGS_PER_CLUSTER)
    cluster_data = await asyncio.to_thread(clusters_db.get_cluster_by_id, uid, cluster_id)
    if not cluster_data:
        logger.warning(f'[TOKI] _update_existing_cluster: cluster {cluster_id} not found for uid={uid}')
        return

    current_embeddings: List[List[float]] = cluster_data.get('embeddings', [])
    current_embeddings.append(emb_list)
    if len(current_embeddings) > MAX_EMBEDDINGS_PER_CLUSTER:
        current_embeddings = current_embeddings[-MAX_EMBEDDINGS_PER_CLUSTER:]

    import database.unknown_speakers as clusters_db  # lazy import

    await asyncio.to_thread(
        clusters_db.update_cluster_embeddings, uid, cluster_id, current_embeddings
    )

    # 2. Update conversation stats + optional sample quote
    duration = _segment_duration(segment)
    quote = _build_sample_quote(segment, conversation_id)

    await asyncio.to_thread(
        clusters_db.add_conversation_to_cluster,
        uid,
        cluster_id,
        conversation_id,
        1,                                           # segment_count
        duration,
        quote.model_dump(mode='json') if quote else None,
    )

    # Track which speaker_id maps to this cluster in this conversation
    # (used by toki_retroactive for Firestore segment tagging)
    if speaker_id is not None:
        await asyncio.to_thread(
            clusters_db.record_speaker_id_for_conversation,
            uid, cluster_id, conversation_id, speaker_id,
        )


async def _create_new_cluster(
    uid: str,
    emb_list: List[float],
    segment: dict,
    conversation_id: str,
    speaker_id: Optional[int] = None,
) -> str:
    """Create a brand-new cluster from a single unmatched segment."""
    import database.unknown_speakers as clusters_db  # lazy import
    from models.unknown_speakers import ClusterStatus  # lazy import

    now = datetime.now(timezone.utc)
    duration = _segment_duration(segment)

    quote = _build_sample_quote(segment, conversation_id)
    quotes_data = [quote.model_dump(mode='json')] if quote else []

    # per_conversation_speakers: maps conv_id → list of speaker_ids seen in that conversation
    per_conv_speakers: dict = {}
    if speaker_id is not None:
        per_conv_speakers[conversation_id] = [speaker_id]

    cluster_data = {
        'uid': uid,
        'status': ClusterStatus.unknown.value,
        'display_name': None,
        'person_id': None,
        'tags': [],
        'embeddings': [emb_list],
        'embedding_count': 1,
        'first_seen': now,
        'last_seen': now,
        'total_segments': 1,
        'total_duration_seconds': duration,
        'conversation_ids': [conversation_id],
        'sample_quotes': quotes_data,
        'audio_sample_url': None,
        'per_conversation_speakers': per_conv_speakers,
        'created_at': now,
        'updated_at': now,
    }

    cluster_id = await asyncio.to_thread(clusters_db.create_cluster, uid, cluster_data)
    return cluster_id


def _compute_centroid(embeddings: List[List[float]]) -> Optional[List[float]]:
    """Mean of a list of same-dimension float vectors. Returns None if empty."""
    if not embeddings:
        return None
    dim = len(embeddings[0])
    centroid = [0.0] * dim
    for emb in embeddings:
        for i, v in enumerate(emb):
            centroid[i] += v
    n = len(embeddings)
    return [v / n for v in centroid]


async def _maybe_update_suggestion(uid: str, cluster_id: str, centroid: List[float]) -> None:
    """
    Background check: if the cluster's centroid is very close (< SUGGESTION_THRESHOLD)
    to any already-named cluster, store a suggestion on the doc.
    Runs fire-and-forget — errors are silently logged.
    """
    try:
        import database.unknown_speakers as clusters_db  # lazy import
        from models.unknown_speakers import UnknownSpeakerClusterDB  # lazy import

        named_docs = await asyncio.to_thread(
            clusters_db.get_clusters_for_user, uid, status='named', limit=100
        )

        best_name: Optional[str] = None
        best_person_id: Optional[str] = None
        best_dist: float = float('inf')

        for doc in named_docs:
            try:
                named = UnknownSpeakerClusterDB(**doc)
                named_centroid = named.get_centroid()
                if named_centroid is None:
                    continue
                dist = compute_cosine_distance(centroid, named_centroid)
                if dist < best_dist:
                    best_dist = dist
                    best_name = named.display_name
                    best_person_id = named.person_id
            except Exception:
                continue

        if best_dist < SUGGESTION_THRESHOLD and best_name:
            await asyncio.to_thread(
                clusters_db.set_cluster_suggestion, uid, cluster_id, best_name, best_person_id
            )
            logger.info(
                f'[TOKI] suggestion set for cluster {cluster_id}: "{best_name}" (dist={best_dist:.3f})'
            )
    except Exception as e:
        logger.warning(f'[TOKI] _maybe_update_suggestion failed for cluster {cluster_id}: {e}')


def _segment_duration(segment: dict) -> float:
    """Extract segment duration in seconds from a segment dict."""
    d = segment.get('duration')
    if d is not None:
        return float(d)
    start = segment.get('abs_start') or segment.get('start') or 0.0
    end = segment.get('abs_end') or segment.get('end') or 0.0
    return max(0.0, float(end) - float(start))
