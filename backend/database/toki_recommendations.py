"""Toki — Recommendations Firestore DB layer."""
import uuid
from datetime import datetime, timezone
from typing import List, Optional


def _col(uid: str):
    from database._client import db
    return db.collection('users').document(uid).collection('toki_recommendations')


def save_recommendations(uid: str, recommendations: list, conversation_id: str) -> List[str]:
    """Save a list of TokiRecommendation objects, returns list of saved IDs."""
    saved = []
    for reco in recommendations:
        doc_id = str(uuid.uuid4())
        data = {
            "id": doc_id,
            "text": reco.text,
            "category": reco.category,
            "recommender": reco.recommender,
            "source_quote": reco.source_quote,
            "confidence": reco.confidence,
            "conversation_id": conversation_id,
            "done": False,
            "created_at": datetime.now(timezone.utc).isoformat(),
        }
        _col(uid).document(doc_id).set(data)
        saved.append(doc_id)
    return saved


def get_recommendations(uid: str, category: Optional[str] = None, include_done: bool = False) -> List[dict]:
    query = _col(uid)
    if not include_done:
        query = query.where("done", "==", False)
    if category:
        query = query.where("category", "==", category)
    docs = query.order_by("created_at", direction="DESCENDING").limit(200).stream()
    return [d.to_dict() for d in docs]


def mark_done(uid: str, reco_id: str) -> bool:
    ref = _col(uid).document(reco_id)
    if not ref.get().exists:
        return False
    ref.update({"done": True})
    return True


def delete_recommendation(uid: str, reco_id: str) -> bool:
    ref = _col(uid).document(reco_id)
    if not ref.get().exists:
        return False
    ref.delete()
    return True
