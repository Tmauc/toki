"""
TOKI — Retroactive Update

Called after a user names an unknown voice persona.
Propagates the new person identity across all past conversations and the vector index.

Pipeline (in order):
  1. Fetch the cluster → get all conversation_ids
  2. Batch update Firestore: for each conversation, tag transcript_segments that
     belong to this speaker with person_id
  3. Update Pinecone metadata: add person_name to `people_mentioned` for each vector
  4. Push notification: "Papa identifié dans 23 conversations"

Design notes:
  - All steps are best-effort: a partial failure is logged but does not abort the job.
  - Firestore writes are done in batches of ≤ 499 ops to stay under the commit limit.
  - Pinecone updates are issued one-by-one (no batch API for metadata updates).
  - `speaker_id` per conversation is resolved from `per_conversation_speakers` stored
    in the cluster doc (populated by speaker_clustering.route_unknown_segment).
    Conversations without this mapping are skipped for transcript tagging (Pinecone
    metadata update still runs for all conversations in the cluster).
"""

import asyncio
import logging
from datetime import datetime, timezone
from typing import Dict, List, Optional

logger = logging.getLogger(__name__)

# Firestore batch ceiling (limit is 500 writes per commit)
_FIRESTORE_BATCH_SIZE = 400


# ──────────────────────────────────────────────────────────────
# Public entry point
# ──────────────────────────────────────────────────────────────

async def run_retroactive_update(
    uid: str,
    cluster_id: str,
    person_id: str,
    person_name: str,
) -> dict:
    """
    Async entry point — called from the /name endpoint as a background task.

    Returns a summary dict with counts for logging/debugging.
    """
    logger.info(
        f'[TOKI] retroactive_update: START uid={uid} cluster={cluster_id} '
        f'person={person_id} name={person_name}'
    )

    summary = {
        'uid': uid,
        'cluster_id': cluster_id,
        'person_id': person_id,
        'person_name': person_name,
        'conversations_total': 0,
        'conversations_firestore_updated': 0,
        'conversations_pinecone_updated': 0,
        'segments_tagged': 0,
        'notification_sent': False,
        'errors': [],
    }

    # 1. Load cluster
    import database.unknown_speakers as clusters_db  # lazy import
    cluster = await asyncio.to_thread(clusters_db.get_cluster_by_id, uid, cluster_id)
    if not cluster:
        logger.error(f'[TOKI] retroactive_update: cluster {cluster_id} not found for uid={uid}')
        return summary

    conversation_ids: List[str] = cluster.get('conversation_ids', [])
    # per_conversation_speakers: {conv_id: [speaker_id, ...]}
    per_conv_speakers: Dict[str, List[int]] = cluster.get('per_conversation_speakers', {})

    summary['conversations_total'] = len(conversation_ids)
    logger.info(
        f'[TOKI] retroactive_update: {len(conversation_ids)} conversations to process '
        f'({len(per_conv_speakers)} with known speaker_id mapping) uid={uid}'
    )

    # 2. Firestore batch update (transcript segments)
    firestore_count, segments_count = await asyncio.to_thread(
        _batch_update_firestore_segments,
        uid, conversation_ids, per_conv_speakers, person_id, summary['errors'],
    )
    summary['conversations_firestore_updated'] = firestore_count
    summary['segments_tagged'] = segments_count

    # 3. Pinecone metadata update
    pinecone_count = await asyncio.to_thread(
        _update_pinecone_metadata,
        uid, conversation_ids, person_name, summary['errors'],
    )
    summary['conversations_pinecone_updated'] = pinecone_count

    # 4. Push notification
    notification_sent = await asyncio.to_thread(
        _send_naming_notification,
        uid, person_name, len(conversation_ids), summary['errors'],
    )
    summary['notification_sent'] = notification_sent

    logger.info(
        f'[TOKI] retroactive_update: DONE uid={uid} cluster={cluster_id} '
        f'firestore={firestore_count} pinecone={pinecone_count} '
        f'segments={segments_count} notif={notification_sent} '
        f'errors={len(summary["errors"])}'
    )
    return summary


# ──────────────────────────────────────────────────────────────
# Step 2 — Firestore transcript segment tagging
# ──────────────────────────────────────────────────────────────

def _batch_update_firestore_segments(
    uid: str,
    conversation_ids: List[str],
    per_conv_speakers: Dict[str, List[int]],
    person_id: str,
    errors: list,
) -> tuple:
    """
    For each conversation with a known speaker_id mapping, update every
    matching transcript_segment to set person_id.

    Returns (conversations_updated, total_segments_tagged).
    """
    from database._client import db  # lazy import — patchable via database._client.db

    conv_updated = 0
    seg_tagged = 0

    for conv_id in conversation_ids:
        speaker_ids = per_conv_speakers.get(conv_id)
        if not speaker_ids:
            # No mapping stored → skip segment tagging for this conversation
            continue

        try:
            conv_ref = (
                db.collection('users').document(uid)
                .collection('conversations').document(conv_id)
            )
            snap = conv_ref.get()
            if not snap.exists:
                continue

            conv_data = snap.to_dict()
            segments = conv_data.get('transcript_segments', [])
            if not segments:
                continue

            changed = False
            for seg in segments:
                if seg.get('speaker_id') in speaker_ids and not seg.get('person_id'):
                    seg['person_id'] = person_id
                    seg_tagged += 1
                    changed = True

            if changed:
                conv_ref.update({'transcript_segments': segments})
                conv_updated += 1

        except Exception as e:
            msg = f'firestore update failed for conv={conv_id}: {e}'
            logger.error(f'[TOKI] retroactive_update: {msg} uid={uid}')
            errors.append(msg)

    return conv_updated, seg_tagged


# ──────────────────────────────────────────────────────────────
# Step 3 — Pinecone metadata update
# ──────────────────────────────────────────────────────────────

def _update_pinecone_metadata(
    uid: str,
    conversation_ids: List[str],
    person_name: str,
    errors: list,
) -> int:
    """
    For each conversation, fetch its Pinecone vector and append person_name
    to the `people_mentioned` metadata list.

    Returns the number of vectors successfully updated.
    """
    try:
        import database.vector_db as _vdb  # lazy import
        index = _vdb.index  # patchable via database.vector_db.index
        if index is None:
            logger.info('[TOKI] retroactive_update: Pinecone not configured, skipping metadata update')
            return 0
    except ImportError:
        return 0

    updated = 0
    for conv_id in conversation_ids:
        try:
            vector_id = f'{uid}-{conv_id}'
            # Fetch current metadata
            fetch_result = index.fetch(ids=[vector_id], namespace='ns1')
            vectors = fetch_result.get('vectors', {})
            if vector_id not in vectors:
                continue

            current_meta: dict = vectors[vector_id].get('metadata', {})
            people: list = current_meta.get('people_mentioned', [])

            if person_name not in people:
                people.append(person_name)
                index.update(
                    id=vector_id,
                    set_metadata={'people_mentioned': people},
                    namespace='ns1',
                )
                updated += 1

        except Exception as e:
            msg = f'pinecone update failed for conv={conv_id}: {e}'
            logger.error(f'[TOKI] retroactive_update: {msg} uid={uid}')
            errors.append(msg)

    return updated


# ──────────────────────────────────────────────────────────────
# Step 4 — Push notification
# ──────────────────────────────────────────────────────────────

def _send_naming_notification(
    uid: str,
    person_name: str,
    conversation_count: int,
    errors: list,
) -> bool:
    """
    Send an FCM push notification to the user's device.
    Returns True if the notification was dispatched successfully.
    """
    try:
        from utils.notifications import send_notification  # lazy import

        if conversation_count == 1:
            body = f'{person_name} identifié dans 1 conversation'
        else:
            body = f'{person_name} identifié dans {conversation_count} conversations'

        send_notification(
            user_id=uid,
            title='Voix identifiée',
            body=body,
            data={'type': 'toki_voice_named', 'person_name': person_name},
        )
        logger.info(f'[TOKI] retroactive_update: notification sent to uid={uid} — {body}')
        return True

    except Exception as e:
        msg = f'notification failed: {e}'
        logger.error(f'[TOKI] retroactive_update: {msg} uid={uid}')
        errors.append(msg)
        return False
