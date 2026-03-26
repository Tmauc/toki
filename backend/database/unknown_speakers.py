"""
TOKI — Firestore CRUD for unknown speaker clusters.

Collection path: users/{uid}/unknown_speakers/{cluster_id}
"""

from datetime import datetime, timezone
from typing import List, Optional, Dict, Any
import logging
import uuid

from google.cloud.firestore_v1 import FieldFilter

from ._client import db

logger = logging.getLogger(__name__)

USERS_COLLECTION = 'users'
CLUSTERS_COLLECTION = 'unknown_speakers'


def _ref(uid: str):
    """Shorthand for the unknown_speakers subcollection reference."""
    return db.collection(USERS_COLLECTION).document(uid).collection(CLUSTERS_COLLECTION)


# ──────────────────────────────────────────────────────────────
# CREATE
# ──────────────────────────────────────────────────────────────

def create_cluster(uid: str, data: dict) -> str:
    """
    Persist a new cluster document.

    The caller should pass the full dict (from UnknownSpeakerClusterDB.model_dump()).
    If 'id' is absent a UUID is generated.
    Returns the document ID.
    """
    if 'id' not in data or not data['id']:
        data['id'] = uuid.uuid4().hex

    cluster_id = data['id']
    _ref(uid).document(cluster_id).set(data)
    logger.info(f'create_cluster uid={uid} cluster_id={cluster_id}')
    return cluster_id


# ──────────────────────────────────────────────────────────────
# READ
# ──────────────────────────────────────────────────────────────

def get_cluster_by_id(uid: str, cluster_id: str) -> Optional[dict]:
    """Return a single cluster dict or None if not found."""
    doc = _ref(uid).document(cluster_id).get()
    if not doc.exists:
        return None
    data = doc.to_dict()
    data['id'] = doc.id
    return data


def get_clusters_for_user(
    uid: str,
    status: Optional[str] = 'unknown',
    limit: int = 100,
) -> List[dict]:
    """
    Return clusters for a user, ordered by last_seen desc.
    Pass status=None to retrieve all statuses.
    """
    query = _ref(uid)

    if status is not None:
        query = query.where(filter=FieldFilter('status', '==', status))

    query = query.order_by('last_seen', direction='DESCENDING').limit(limit)

    results = []
    for doc in query.stream():
        data = doc.to_dict()
        data['id'] = doc.id
        results.append(data)

    logger.info(f'get_clusters_for_user uid={uid} status={status} count={len(results)}')
    return results


def get_clusters_with_embeddings(uid: str) -> List[dict]:
    """
    Return all non-deleted clusters that have at least one embedding.
    Used by the clustering algorithm to find the best match for a new segment.
    Excludes 'deleted' clusters. Embeddings are included (heavy — use sparingly).
    """
    query = (
        _ref(uid)
        .where(filter=FieldFilter('status', '!=', 'deleted'))
        .where(filter=FieldFilter('embedding_count', '>=', 1))
    )

    results = []
    for doc in query.stream():
        data = doc.to_dict()
        data['id'] = doc.id
        results.append(data)

    logger.info(f'get_clusters_with_embeddings uid={uid} count={len(results)}')
    return results


# ──────────────────────────────────────────────────────────────
# UPDATE — embeddings / centroid
# ──────────────────────────────────────────────────────────────

def update_cluster_embeddings(
    uid: str,
    cluster_id: str,
    embeddings: List[List[float]],
) -> None:
    """Replace the stored embeddings list and refresh the count + updated_at."""
    _ref(uid).document(cluster_id).update({
        'embeddings': embeddings,
        'embedding_count': len(embeddings),
        'updated_at': datetime.now(timezone.utc),
    })
    logger.info(f'update_cluster_embeddings uid={uid} cluster_id={cluster_id} n={len(embeddings)}')


# ──────────────────────────────────────────────────────────────
# UPDATE — conversation / segment tracking
# ──────────────────────────────────────────────────────────────

def add_conversation_to_cluster(
    uid: str,
    cluster_id: str,
    conversation_id: str,
    segment_count: int = 1,
    duration_seconds: float = 0.0,
    sample_quote: Optional[Dict[str, Any]] = None,
    last_seen: Optional[datetime] = None,
) -> None:
    """
    Append a conversation reference to the cluster and update stats.
    sample_quote should be a dict matching SampleQuote fields.
    At most 5 sample_quotes are kept (oldest dropped if over limit).
    """
    from google.cloud import firestore as _fs

    doc_ref = _ref(uid).document(cluster_id)
    now = last_seen or datetime.now(timezone.utc)

    update: Dict[str, Any] = {
        'total_segments': _fs.Increment(segment_count),
        'total_duration_seconds': _fs.Increment(duration_seconds),
        'last_seen': now,
        'updated_at': now,
    }

    # conversation_ids: add only if not already present (Firestore arrayUnion)
    update['conversation_ids'] = _fs.ArrayUnion([conversation_id])

    doc_ref.update(update)

    # sample_quotes: fetch current and manage the 5-item cap in a separate step
    if sample_quote:
        _append_sample_quote(uid, cluster_id, sample_quote)

    logger.info(
        f'add_conversation_to_cluster uid={uid} cluster_id={cluster_id} '
        f'conv={conversation_id} seg={segment_count} dur={duration_seconds:.1f}s'
    )


def _append_sample_quote(uid: str, cluster_id: str, quote: Dict[str, Any]) -> None:
    """Keep at most 5 sample quotes, dropping the oldest when over the limit."""
    doc_ref = _ref(uid).document(cluster_id)
    snap = doc_ref.get(['sample_quotes'])
    quotes: list = snap.to_dict().get('sample_quotes', []) if snap.exists else []
    quotes.append(quote)
    if len(quotes) > 5:
        quotes = quotes[-5:]
    doc_ref.update({'sample_quotes': quotes})


# ──────────────────────────────────────────────────────────────
# UPDATE — naming
# ──────────────────────────────────────────────────────────────

def assign_name_to_cluster(
    uid: str,
    cluster_id: str,
    display_name: str,
    person_id: str,
    tags: Optional[List[str]] = None,
) -> None:
    """
    Name a cluster: set display_name, link to a person, mark status as 'named'.
    Called after the user identifies a voice persona.
    """
    _ref(uid).document(cluster_id).update({
        'display_name': display_name,
        'person_id': person_id,
        'status': 'named',
        'tags': tags or [],
        'updated_at': datetime.now(timezone.utc),
    })
    logger.info(f'assign_name_to_cluster uid={uid} cluster_id={cluster_id} name={display_name}')


# ──────────────────────────────────────────────────────────────
# UPDATE — merge
# ──────────────────────────────────────────────────────────────

def merge_clusters(uid: str, source_id: str, target_id: str) -> None:
    """
    Merge source cluster into target cluster.
    - conversation_ids, embeddings (up to 10), sample_quotes (up to 5) are merged
    - Stats (total_segments, total_duration_seconds) are summed
    - Source cluster is deleted afterward
    """
    source = get_cluster_by_id(uid, source_id)
    target = get_cluster_by_id(uid, target_id)

    if not source or not target:
        raise ValueError(f'merge_clusters: cluster not found — source={source_id} target={target_id}')

    # Merge conversation IDs (dedup)
    merged_conv_ids = list({*target.get('conversation_ids', []), *source.get('conversation_ids', [])})

    # Merge embeddings — keep latest 10
    merged_embeddings = (target.get('embeddings', []) + source.get('embeddings', []))[-10:]

    # Merge sample quotes — keep latest 5
    merged_quotes = (target.get('sample_quotes', []) + source.get('sample_quotes', []))[-5:]

    # Sum stats
    merged_segments = target.get('total_segments', 0) + source.get('total_segments', 0)
    merged_duration = target.get('total_duration_seconds', 0.0) + source.get('total_duration_seconds', 0.0)

    # first_seen = earliest of the two
    src_first = source.get('first_seen')
    tgt_first = target.get('first_seen')
    if src_first and tgt_first:
        first_seen = min(src_first, tgt_first)
    else:
        first_seen = tgt_first or src_first

    now = datetime.now(timezone.utc)

    _ref(uid).document(target_id).update({
        'conversation_ids': merged_conv_ids,
        'embeddings': merged_embeddings,
        'embedding_count': len(merged_embeddings),
        'sample_quotes': merged_quotes,
        'total_segments': merged_segments,
        'total_duration_seconds': merged_duration,
        'first_seen': first_seen,
        'last_seen': now,
        'updated_at': now,
    })

    # Remove the source cluster
    _ref(uid).document(source_id).delete()

    logger.info(f'merge_clusters uid={uid} source={source_id} -> target={target_id}')


# ──────────────────────────────────────────────────────────────
# UPDATE — audio sample URL
# ──────────────────────────────────────────────────────────────

def record_speaker_id_for_conversation(
    uid: str,
    cluster_id: str,
    conversation_id: str,
    speaker_id: int,
) -> None:
    """
    Record that `speaker_id` (diarizer index) in `conversation_id` belongs to this cluster.
    Used by toki_retroactive to know which segments to tag with person_id.
    Stored as per_conversation_speakers: {conv_id: [speaker_id, ...]} in the cluster doc.
    """
    doc_ref = _ref(uid).document(cluster_id)
    snap = doc_ref.get(['per_conversation_speakers'])
    mapping: dict = snap.to_dict().get('per_conversation_speakers', {}) if snap.exists else {}

    spk_list = mapping.get(conversation_id, [])
    if speaker_id not in spk_list:
        spk_list.append(speaker_id)
        mapping[conversation_id] = spk_list
        doc_ref.update({
            'per_conversation_speakers': mapping,
            'updated_at': datetime.now(timezone.utc),
        })


def set_audio_sample_url(uid: str, cluster_id: str, url: str) -> None:
    """Store the GCS URL of the 5-second audio clip for in-app playback."""
    _ref(uid).document(cluster_id).update({
        'audio_sample_url': url,
        'updated_at': datetime.now(timezone.utc),
    })


# ──────────────────────────────────────────────────────────────
# DELETE
# ──────────────────────────────────────────────────────────────

def delete_cluster(uid: str, cluster_id: str) -> None:
    """Soft-delete: mark status as 'deleted'. Does not remove the document."""
    _ref(uid).document(cluster_id).update({
        'status': 'deleted',
        'updated_at': datetime.now(timezone.utc),
    })
    logger.info(f'delete_cluster uid={uid} cluster_id={cluster_id}')


def hard_delete_cluster(uid: str, cluster_id: str) -> None:
    """Permanently remove the cluster document from Firestore."""
    _ref(uid).document(cluster_id).delete()
    logger.info(f'hard_delete_cluster uid={uid} cluster_id={cluster_id}')


def delete_all_clusters(uid: str) -> None:
    """Permanently remove all clusters for a user (e.g. account deletion)."""
    batch = db.batch()
    count = 0
    for doc in _ref(uid).stream():
        batch.delete(doc.reference)
        count += 1
        if count >= 499:
            batch.commit()
            batch = db.batch()
            count = 0
    if count > 0:
        batch.commit()
    logger.info(f'delete_all_clusters uid={uid}')


# ──────────────────────────────────────────────────────────────
# SUGGESTION
# ──────────────────────────────────────────────────────────────

def split_cluster(
    uid: str,
    cluster_id: str,
    move_conv_ids: List[str],
) -> str:
    """
    Move a subset of conversations from an existing cluster into a brand-new cluster.

    The new cluster inherits:
      - the quotes and per_conversation_speakers entries for move_conv_ids
      - proportional segment/duration stats
      - status = 'unknown' (user can name it afterwards)

    The original cluster loses those conversations.
    Returns the new cluster_id.
    """
    now = datetime.now(timezone.utc)

    original = get_cluster_by_id(uid, cluster_id)
    if not original:
        raise ValueError(f'Cluster {cluster_id} not found for uid {uid}')

    all_conv_ids: List[str] = original.get('conversation_ids', [])
    all_quotes: List[dict] = original.get('sample_quotes', [])
    per_conv: dict = original.get('per_conversation_speakers', {})

    # Split quotes
    new_quotes = [q for q in all_quotes if q.get('conversation_id') in move_conv_ids]
    kept_quotes = [q for q in all_quotes if q.get('conversation_id') not in move_conv_ids]

    # Split per_conversation_speakers
    new_per_conv = {k: v for k, v in per_conv.items() if k in move_conv_ids}
    kept_per_conv = {k: v for k, v in per_conv.items() if k not in move_conv_ids}

    # Proportional stats
    total_segs = original.get('total_segments', 0)
    total_dur = original.get('total_duration_seconds', 0.0)
    total_convs = max(len(all_conv_ids), 1)
    move_ratio = len(move_conv_ids) / total_convs
    new_segs = max(1, int(round(total_segs * move_ratio)))
    new_dur = total_dur * move_ratio

    new_conv_ids = [c for c in all_conv_ids if c in move_conv_ids]
    kept_conv_ids = [c for c in all_conv_ids if c not in move_conv_ids]

    # Create new cluster
    new_cluster_data = {
        'uid': uid,
        'status': 'unknown',
        'display_name': None,
        'person_id': None,
        'tags': [],
        'embeddings': [],
        'embedding_count': 0,
        'first_seen': original.get('first_seen', now),
        'last_seen': original.get('last_seen', now),
        'total_segments': new_segs,
        'total_duration_seconds': new_dur,
        'conversation_ids': new_conv_ids,
        'per_conversation_speakers': new_per_conv,
        'sample_quotes': new_quotes[:5],
        'audio_sample_url': None,
        'suggestion_name': None,
        'suggestion_person_id': None,
        'created_at': now,
        'updated_at': now,
    }
    new_id = uuid.uuid4().hex
    new_cluster_data['id'] = new_id
    _ref(uid).document(new_id).set(new_cluster_data)

    # Update original cluster
    _ref(uid).document(cluster_id).update({
        'conversation_ids': kept_conv_ids,
        'sample_quotes': kept_quotes[:5],
        'per_conversation_speakers': kept_per_conv,
        'total_segments': max(0, total_segs - new_segs),
        'total_duration_seconds': max(0.0, total_dur - new_dur),
        'updated_at': now,
    })

    logger.info(
        f'split_cluster uid={uid} original={cluster_id} new={new_id} '
        f'moved={len(new_conv_ids)} kept={len(kept_conv_ids)}'
    )
    return new_id


def set_cluster_suggestion(
    uid: str,
    cluster_id: str,
    name: str,
    person_id: Optional[str],
) -> None:
    """Store an auto-suggestion (looks like an already-named person)."""
    _ref(uid).document(cluster_id).update({
        'suggestion_name': name,
        'suggestion_person_id': person_id,
        'updated_at': datetime.now(timezone.utc),
    })
    logger.info(f'set_cluster_suggestion uid={uid} cluster_id={cluster_id} name={name}')


def clear_cluster_suggestion(uid: str, cluster_id: str) -> None:
    """Remove the suggestion (user rejected it or cluster was named)."""
    _ref(uid).document(cluster_id).update({
        'suggestion_name': None,
        'suggestion_person_id': None,
        'updated_at': datetime.now(timezone.utc),
    })
    logger.info(f'clear_cluster_suggestion uid={uid} cluster_id={cluster_id}')
