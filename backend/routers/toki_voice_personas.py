"""
TOKI — Voice Personas API

Endpoints for managing unknown-speaker clusters.
All routes are prefixed with /v1/toki/voice-personas.

Phase C of the Voice Personas feature (see docs/toki/voice-personas/ROADMAP.md).
"""

import logging
from datetime import datetime, timezone
from typing import List, Optional

from fastapi import APIRouter, BackgroundTasks, Depends, HTTPException, Query

import database.unknown_speakers as clusters_db
from models.unknown_speakers import (
    ClusterStatus,
    ClusterSummary,
    ConversationEntry,
    MergeRequest,
    NamingRequest,
    SplitRequest,
    UnknownSpeakerClusterDB,
)
from utils.other.endpoints import get_current_user_uid

logger = logging.getLogger(__name__)

router = APIRouter(
    prefix='/v1/toki/voice-personas',
    tags=['toki-voice-personas'],
)


# ─── Helpers ──────────────────────────────────────────────────

def _get_cluster_or_404(uid: str, cluster_id: str) -> dict:
    cluster = clusters_db.get_cluster_by_id(uid, cluster_id)
    if not cluster:
        raise HTTPException(status_code=404, detail='Voice persona not found')
    if cluster.get('status') == ClusterStatus.deleted.value:
        raise HTTPException(status_code=404, detail='Voice persona has been deleted')
    return cluster


# ─── GET /  ───────────────────────────────────────────────────

@router.get('/', response_model=List[ClusterSummary])
def list_voice_personas(
    status: Optional[str] = Query(default='unknown', description='Filter by status (unknown|named|deleted). Omit for all.'),
    limit: int = Query(default=50, ge=1, le=200),
    uid: str = Depends(get_current_user_uid),
):
    """
    List all voice persona clusters for the current user.
    Default: only `unknown` status clusters, ordered by last_seen desc.
    """
    # Pass None to get all statuses when explicitly requested
    filter_status = status if status in ('unknown', 'named', 'deleted') else None
    raw = clusters_db.get_clusters_for_user(uid, status=filter_status, limit=limit)

    results = []
    for doc in raw:
        try:
            cluster = UnknownSpeakerClusterDB(**doc)
            results.append(ClusterSummary.from_db(cluster))
        except Exception as e:
            logger.warning(f'list_voice_personas: skipping malformed cluster {doc.get("id")}: {e}')

    return results


# ─── GET /lookup  ────────────────────────────────────────────

@router.get('/lookup', response_model=ClusterSummary)
def lookup_cluster_for_segment(
    conversation_id: str = Query(..., description='Conversation ID'),
    speaker_id: str = Query(..., description='Speaker label, e.g. SPEAKER_01'),
    uid: str = Depends(get_current_user_uid),
):
    """
    Find the unknown-speaker cluster that contains a specific
    (conversation_id, speaker_id) pair.  Used by the conversation-detail
    screen to deep-link into the naming flow.
    Returns 404 if no matching cluster is found.
    """
    raw = clusters_db.get_clusters_for_user(uid, status='unknown', limit=200)
    for doc in raw:
        try:
            cluster = UnknownSpeakerClusterDB(**doc)
            speakers = cluster.per_conversation_speakers.get(conversation_id, [])
            if speaker_id in speakers:
                return ClusterSummary.from_db(cluster)
        except Exception:
            continue
    raise HTTPException(status_code=404, detail='No cluster found for this segment')


# ─── GET /{id}  ───────────────────────────────────────────────

@router.get('/{cluster_id}', response_model=ClusterSummary)
def get_voice_persona(
    cluster_id: str,
    uid: str = Depends(get_current_user_uid),
):
    """Return the full summary for a single cluster, including all conversation IDs."""
    doc = _get_cluster_or_404(uid, cluster_id)
    cluster = UnknownSpeakerClusterDB(**doc)
    return ClusterSummary.from_db(cluster)


# ─── GET /{id}/audio  ─────────────────────────────────────────

@router.get('/{cluster_id}/audio')
def get_audio_url(
    cluster_id: str,
    uid: str = Depends(get_current_user_uid),
):
    """
    Return the GCS audio sample URL for a cluster.
    The URL can be used by the app to stream a 5-second clip.
    Returns 404 if no audio sample has been extracted yet.
    """
    doc = _get_cluster_or_404(uid, cluster_id)
    url = doc.get('audio_sample_url')
    if not url:
        raise HTTPException(status_code=404, detail='No audio sample available for this voice persona yet')
    return {'audio_sample_url': url}


# ─── POST /{id}/name  ─────────────────────────────────────────

@router.post('/{cluster_id}/name', response_model=ClusterSummary)
def name_voice_persona(
    cluster_id: str,
    body: NamingRequest,
    background_tasks: BackgroundTasks,
    uid: str = Depends(get_current_user_uid),
):
    """
    Name an unknown voice persona.

    - Sets display_name, status → 'named', links to a person (or creates one).
    - Triggers a background retroactive update across all conversations where
      this cluster was detected (Phase E — toki_retroactive.py).
    """
    doc = _get_cluster_or_404(uid, cluster_id)

    # If no person_id provided, we need to create one.
    # For now we generate a placeholder ID; Phase E will handle full people/ creation.
    person_id = body.person_id
    if not person_id:
        import uuid
        person_id = uuid.uuid4().hex
        logger.info(f'name_voice_persona: creating new person_id={person_id} for cluster {cluster_id} uid={uid}')

    tags = [t.value for t in body.tags]
    clusters_db.assign_name_to_cluster(uid, cluster_id, body.name, person_id, tags)

    # Phase E: retroactive update (fire-and-forget background task)
    from utils.toki_retroactive import run_retroactive_update
    background_tasks.add_task(
        _run_retroactive_async, uid, cluster_id, person_id, body.name
    )

    # Return updated summary
    updated = clusters_db.get_cluster_by_id(uid, cluster_id)
    cluster = UnknownSpeakerClusterDB(**updated)
    return ClusterSummary.from_db(cluster)


def _run_retroactive_async(uid: str, cluster_id: str, person_id: str, display_name: str) -> None:
    """Sync wrapper so FastAPI BackgroundTasks can call the async retroactive update."""
    import asyncio
    from utils.toki_retroactive import run_retroactive_update
    asyncio.run(run_retroactive_update(uid, cluster_id, person_id, display_name))


# ─── POST /{id}/merge/{other_id}  ────────────────────────────

@router.post('/{cluster_id}/merge/{other_id}', response_model=ClusterSummary)
def merge_voice_personas(
    cluster_id: str,
    other_id: str,
    body: MergeRequest,
    uid: str = Depends(get_current_user_uid),
):
    """
    Merge two clusters that turned out to be the same person.
    `keep_id` in the body must match either cluster_id or other_id.
    The other cluster is absorbed and deleted.
    """
    if body.keep_id not in (cluster_id, other_id):
        raise HTTPException(
            status_code=422,
            detail=f'keep_id must be one of the two cluster IDs ({cluster_id}, {other_id})',
        )

    # Validate both exist
    _get_cluster_or_404(uid, cluster_id)
    _get_cluster_or_404(uid, other_id)

    source_id = other_id if body.keep_id == cluster_id else cluster_id
    target_id = body.keep_id

    try:
        clusters_db.merge_clusters(uid, source_id=source_id, target_id=target_id)
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))

    updated = clusters_db.get_cluster_by_id(uid, target_id)
    cluster = UnknownSpeakerClusterDB(**updated)
    return ClusterSummary.from_db(cluster)


# ─── POST /{id}/confirm-suggestion  ─────────────────────────

@router.post('/{cluster_id}/confirm-suggestion', response_model=ClusterSummary)
def confirm_suggestion(
    cluster_id: str,
    background_tasks: BackgroundTasks,
    uid: str = Depends(get_current_user_uid),
):
    """
    Accept the auto-suggestion ("Yes, this is Papa").
    Names the cluster with the suggested person_id/name, then clears the
    suggestion field and triggers a retroactive update — exactly like POST /name.
    """
    doc = _get_cluster_or_404(uid, cluster_id)
    cluster = UnknownSpeakerClusterDB(**doc)

    if not cluster.suggestion_name:
        raise HTTPException(status_code=422, detail='No suggestion to confirm for this cluster')

    name = cluster.suggestion_name
    person_id = cluster.suggestion_person_id or ''
    if not person_id:
        import uuid
        person_id = uuid.uuid4().hex

    tags = [t.value for t in cluster.tags]
    clusters_db.assign_name_to_cluster(uid, cluster_id, name, person_id, tags)
    clusters_db.clear_cluster_suggestion(uid, cluster_id)

    background_tasks.add_task(_run_retroactive_async, uid, cluster_id, person_id, name)

    updated = clusters_db.get_cluster_by_id(uid, cluster_id)
    return ClusterSummary.from_db(UnknownSpeakerClusterDB(**updated))


# ─── POST /{id}/reject-suggestion  ───────────────────────────

@router.post('/{cluster_id}/reject-suggestion')
def reject_suggestion(
    cluster_id: str,
    uid: str = Depends(get_current_user_uid),
):
    """
    Dismiss the auto-suggestion ("No, this is not Papa").
    Clears the suggestion fields so it won't appear again.
    """
    _get_cluster_or_404(uid, cluster_id)
    clusters_db.clear_cluster_suggestion(uid, cluster_id)
    return {'status': 'rejected', 'id': cluster_id}


# ─── GET /{id}/conversations  ────────────────────────────────

@router.get('/{cluster_id}/conversations', response_model=list[ConversationEntry])
def list_cluster_conversations(
    cluster_id: str,
    uid: str = Depends(get_current_user_uid),
):
    """
    Return a lightweight per-conversation summary for a cluster.
    Used by the split UI to let the user pick which conversations to move.
    """
    doc = _get_cluster_or_404(uid, cluster_id)
    cluster = UnknownSpeakerClusterDB(**doc)

    # Group quotes by conversation_id
    quotes_by_conv: dict = {}
    for q in cluster.sample_quotes:
        conv_id = q.conversation_id
        if conv_id not in quotes_by_conv:
            quotes_by_conv[conv_id] = {'quotes': [], 'timestamp': q.timestamp}
        if len(quotes_by_conv[conv_id]['quotes']) < 3:
            quotes_by_conv[conv_id]['quotes'].append(q.text)

    entries = []
    for conv_id in cluster.conversation_ids:
        info = quotes_by_conv.get(conv_id, {})
        entries.append(ConversationEntry(
            conversation_id=conv_id,
            quotes=info.get('quotes', []),
            timestamp=info.get('timestamp'),
        ))

    # Sort by timestamp descending (most recent first), unknowns last
    entries.sort(key=lambda e: e.timestamp or datetime.min.replace(tzinfo=timezone.utc), reverse=True)
    return entries


# ─── POST /{id}/split  ───────────────────────────────────────

@router.post('/{cluster_id}/split', response_model=ClusterSummary)
def split_voice_persona(
    cluster_id: str,
    body: SplitRequest,
    uid: str = Depends(get_current_user_uid),
):
    """
    Split a cluster: move a subset of conversations into a new unknown cluster.
    Returns the summary of the newly-created cluster.
    The original cluster is updated in-place (not returned here).
    """
    doc = _get_cluster_or_404(uid, cluster_id)
    cluster = UnknownSpeakerClusterDB(**doc)

    # Validate that the requested conv IDs belong to this cluster
    valid_ids = set(cluster.conversation_ids)
    invalid = [c for c in body.conversation_ids if c not in valid_ids]
    if invalid:
        raise HTTPException(
            status_code=422,
            detail=f'conversation_ids not in this cluster: {invalid}',
        )
    if set(body.conversation_ids) == valid_ids:
        raise HTTPException(
            status_code=422,
            detail='Cannot move all conversations — at least one must remain in the original cluster',
        )

    try:
        new_id = clusters_db.split_cluster(uid, cluster_id, body.conversation_ids)
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))

    new_doc = clusters_db.get_cluster_by_id(uid, new_id)
    return ClusterSummary.from_db(UnknownSpeakerClusterDB(**new_doc))


# ─── DELETE /{id}  ───────────────────────────────────────────

@router.delete('/{cluster_id}')
def delete_voice_persona(
    cluster_id: str,
    uid: str = Depends(get_current_user_uid),
):
    """
    Soft-delete a cluster (status → 'deleted').
    The cluster data is preserved for audit purposes but won't appear in normal listings.
    """
    _get_cluster_or_404(uid, cluster_id)
    clusters_db.delete_cluster(uid, cluster_id)
    return {'status': 'deleted', 'id': cluster_id}
