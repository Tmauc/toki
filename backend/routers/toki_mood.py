"""TOKI — Mood Trends API. Routes: /v1/toki/mood"""
import logging
from datetime import datetime, timezone, timedelta
from typing import List

from fastapi import APIRouter, Depends, Query
from pydantic import BaseModel

import database.toki_mood as mood_db
from utils.other.endpoints import get_current_user_uid

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/v1/toki/mood", tags=["toki-mood"])

MOOD_SCORE = {
    "great": 5,
    "good": 4,
    "neutral": 3,
    "tired": 2,
    "stressed": 2,
    "anxious": 2,
    "sad": 1,
    "angry": 1,
}


class MoodEntryOut(BaseModel):
    id: str
    mood: str
    energy: str
    signals: List[str]
    confidence: float
    conversation_id: str
    created_at: str
    score: int


class MoodTrend(BaseModel):
    date: str           # YYYY-MM-DD
    avg_score: float
    dominant_mood: str
    entry_count: int


@router.get("/entries", response_model=List[MoodEntryOut])
def get_entries(
    days: int = Query(30, ge=1, le=365),
    uid: str = Depends(get_current_user_uid),
):
    """Return mood entries for the past N days."""
    since = (datetime.now(timezone.utc) - timedelta(days=days)).isoformat()
    entries = mood_db.get_mood_entries(uid, since_iso=since, limit=500)
    return [
        MoodEntryOut(**e, score=MOOD_SCORE.get(e["mood"], 3))
        for e in entries
    ]


@router.get("/trends", response_model=List[MoodTrend])
def get_trends(
    days: int = Query(30, ge=7, le=365),
    uid: str = Depends(get_current_user_uid),
):
    """Return daily mood trends aggregated over the past N days."""
    since = (datetime.now(timezone.utc) - timedelta(days=days)).isoformat()
    entries = mood_db.get_mood_entries(uid, since_iso=since, limit=500)

    # Group by day
    by_day: dict = {}
    for e in entries:
        day = e["created_at"][:10]
        by_day.setdefault(day, []).append(e)

    trends = []
    for day, day_entries in sorted(by_day.items()):
        scores = [MOOD_SCORE.get(e["mood"], 3) for e in day_entries]
        moods = [e["mood"] for e in day_entries]
        dominant = max(set(moods), key=moods.count)
        trends.append(MoodTrend(
            date=day,
            avg_score=round(sum(scores) / len(scores), 2),
            dominant_mood=dominant,
            entry_count=len(day_entries),
        ))
    return trends
