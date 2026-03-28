"""TOKI — Recommendations API. Routes: /v1/toki/recommendations"""
import logging
from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel

import database.toki_recommendations as reco_db
from utils.other.endpoints import get_current_user_uid

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/v1/toki/recommendations", tags=["toki-recommendations"])


class RecommendationOut(BaseModel):
    id: str
    text: str
    category: str
    recommender: Optional[str] = None
    source_quote: Optional[str] = None
    conversation_id: str
    done: bool
    created_at: str


@router.get("", response_model=List[RecommendationOut])
def list_recommendations(
    category: Optional[str] = None,
    include_done: bool = False,
    uid: str = Depends(get_current_user_uid),
):
    """List recommendations for the current user, optionally filtered by category."""
    return reco_db.get_recommendations(uid, category=category, include_done=include_done)


@router.post("/{reco_id}/done", status_code=204)
def mark_done(reco_id: str, uid: str = Depends(get_current_user_uid)):
    """Mark a recommendation as done (consumed)."""
    if not reco_db.mark_done(uid, reco_id):
        raise HTTPException(status_code=404, detail="Recommendation not found")


@router.delete("/{reco_id}", status_code=204)
def delete_recommendation(reco_id: str, uid: str = Depends(get_current_user_uid)):
    """Delete a recommendation permanently."""
    if not reco_db.delete_recommendation(uid, reco_id):
        raise HTTPException(status_code=404, detail="Recommendation not found")
