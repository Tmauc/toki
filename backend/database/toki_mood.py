"""Toki — Mood entries Firestore DB layer."""
import uuid
from datetime import datetime, timezone
from typing import List, Optional


def _col(uid: str):
    from database._client import db
    return db.collection('users').document(uid).collection('toki_mood')


def save_mood(uid: str, mood_entry, conversation_id: str) -> str:
    """Save a TokiMoodEntry object, returns the new document ID."""
    doc_id = str(uuid.uuid4())
    data = {
        "id": doc_id,
        "mood": mood_entry.mood,
        "energy": mood_entry.energy,
        "signals": mood_entry.signals,
        "confidence": mood_entry.confidence,
        "conversation_id": conversation_id,
        "created_at": datetime.now(timezone.utc).isoformat(),
    }
    _col(uid).document(doc_id).set(data)
    return doc_id


def get_mood_entries(uid: str, since_iso: Optional[str] = None, limit: int = 90) -> List[dict]:
    query = _col(uid).order_by("created_at", direction="DESCENDING")
    if since_iso:
        query = query.where("created_at", ">=", since_iso)
    return [d.to_dict() for d in query.limit(limit).stream()]
