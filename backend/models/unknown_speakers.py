"""
TOKI — Unknown Speaker Clustering Models

Inspired by Apple Photos "People" feature: voices heard in conversations are
automatically clustered. The user can then name or delete each cluster.
Once named, all past conversations are retroactively tagged.
"""

from datetime import datetime, timezone
from enum import Enum
from typing import Dict, List, Optional

from pydantic import BaseModel, Field


class ClusterStatus(str, Enum):
    unknown = "unknown"   # not yet identified
    named = "named"       # user assigned a name
    deleted = "deleted"   # user dismissed / deleted


class PersonTag(str, Enum):
    famille = "famille"
    ami = "ami"
    collegue = "collegue"
    connaissance = "connaissance"
    autre = "autre"


class SampleQuote(BaseModel):
    """A short speech excerpt used to help the user identify a cluster."""

    text: str = Field(description="Transcribed speech from this speaker (max 30 words)")
    conversation_id: str = Field(description="ID of the source conversation")
    timestamp: datetime = Field(description="When this quote was spoken")


class UnknownSpeakerCluster(BaseModel):
    """
    A group of voice segments that share the same speaker identity,
    but whose name is not yet known.
    """

    # Identity
    uid: str = Field(description="Owner user ID")
    display_name: Optional[str] = Field(
        default=None,
        description="Name assigned by user (e.g. 'Papa'). None until named.",
    )
    person_id: Optional[str] = Field(
        default=None,
        description="Link to people/{id} once named.",
    )
    status: ClusterStatus = Field(default=ClusterStatus.unknown)
    tags: List[PersonTag] = Field(
        default_factory=list,
        description="Relationship tags assigned at naming time.",
    )

    # Voice data
    embeddings: List[List[float]] = Field(
        default_factory=list,
        description="Voice embedding vectors (multiple for robustness). Centroid computed at query time.",
    )
    embedding_count: int = Field(default=0)

    # Statistics
    first_seen: datetime = Field(default_factory=lambda: datetime.now(timezone.utc))
    last_seen: datetime = Field(default_factory=lambda: datetime.now(timezone.utc))
    total_segments: int = Field(default=0, description="Number of speech segments attributed to this cluster")
    total_duration_seconds: float = Field(default=0.0, description="Total estimated speaking time in seconds")

    # References
    conversation_ids: List[str] = Field(
        default_factory=list,
        description="All conversations where this voice was detected",
    )
    per_conversation_speakers: Dict[str, List[str]] = Field(
        default_factory=dict,
        description="Maps conversation_id → list of raw speaker labels (e.g. 'SPEAKER_01') seen in that conversation",
    )
    sample_quotes: List[SampleQuote] = Field(
        default_factory=list,
        description="Up to 5 short quotes to help user identify the speaker",
        max_length=5,
    )

    # Optional audio sample for playback in app
    audio_sample_url: Optional[str] = Field(
        default=None,
        description="GCS URL to a 5-second audio clip for in-app playback",
    )

    # Auto-suggestion: this cluster looks like an already-named person
    suggestion_name: Optional[str] = Field(
        default=None,
        description="Display name of the suggested person (e.g. 'Papa')",
    )
    suggestion_person_id: Optional[str] = Field(
        default=None,
        description="person_id of the named cluster that triggered the suggestion",
    )

    # Timestamps
    created_at: datetime = Field(default_factory=lambda: datetime.now(timezone.utc))
    updated_at: datetime = Field(default_factory=lambda: datetime.now(timezone.utc))

    def add_conversation(self, conversation_id: str) -> None:
        if conversation_id not in self.conversation_ids:
            self.conversation_ids.append(conversation_id)

    def add_embedding(self, embedding: List[float]) -> None:
        """Keep at most 10 embeddings to bound storage size."""
        self.embeddings.append(embedding)
        if len(self.embeddings) > 10:
            self.embeddings = self.embeddings[-10:]
        self.embedding_count = len(self.embeddings)

    def get_centroid(self) -> Optional[List[float]]:
        """Compute mean embedding for robust comparison."""
        if not self.embeddings:
            return None
        dim = len(self.embeddings[0])
        centroid = [0.0] * dim
        for emb in self.embeddings:
            for i, v in enumerate(emb):
                centroid[i] += v
        n = len(self.embeddings)
        return [v / n for v in centroid]

    @property
    def label(self) -> str:
        """Human-readable label: name if known, else 'Inconnu #<short_id>'."""
        if self.display_name:
            return self.display_name
        return f"Inconnu #{self.id[:4].upper()}" if hasattr(self, 'id') else "Inconnu"


class UnknownSpeakerClusterDB(UnknownSpeakerCluster):
    """Cluster as stored in Firestore (includes the document id)."""

    id: str = Field(description="Firestore document ID (auto-generated)")

    @property
    def label(self) -> str:
        if self.display_name:
            return self.display_name
        return f"Inconnu #{self.id[:4].upper()}"


# ─── Request / Response models ───────────────────────────────

class NamingRequest(BaseModel):
    """Payload for POST /v1/toki/voice-personas/{id}/name"""

    name: str = Field(description="Name to assign (e.g. 'Papa', 'Marie')", min_length=1, max_length=60)
    person_id: Optional[str] = Field(
        default=None,
        description="If provided, link to an existing person in people/. If null, create a new one.",
    )
    tags: List[PersonTag] = Field(default_factory=list)


class MergeRequest(BaseModel):
    """Payload for POST /v1/toki/voice-personas/{id}/merge/{other_id}"""

    keep_id: str = Field(description="ID of the cluster to keep (the other will be merged into this one)")


class SplitRequest(BaseModel):
    """Payload for POST /v1/toki/voice-personas/{id}/split"""

    conversation_ids: List[str] = Field(
        description="Conversation IDs to move into the new cluster",
        min_length=1,
    )


class ConversationEntry(BaseModel):
    """Lightweight per-conversation summary for the split UI."""

    conversation_id: str
    quotes: List[str] = Field(default_factory=list, description="Up to 3 quote texts from this conversation")
    timestamp: Optional[datetime] = None


class ClusterSummary(BaseModel):
    """Lightweight cluster info for list views in the app."""

    id: str
    label: str
    status: ClusterStatus
    total_segments: int
    total_duration_seconds: float
    first_seen: datetime
    last_seen: datetime
    conversation_count: int
    sample_quotes: List[SampleQuote] = Field(default_factory=list)
    audio_sample_url: Optional[str] = None
    tags: List[PersonTag] = Field(default_factory=list)
    suggestion_name: Optional[str] = None
    suggestion_person_id: Optional[str] = None

    @staticmethod
    def from_db(cluster: UnknownSpeakerClusterDB) -> 'ClusterSummary':
        return ClusterSummary(
            id=cluster.id,
            label=cluster.label,
            status=cluster.status,
            total_segments=cluster.total_segments,
            total_duration_seconds=cluster.total_duration_seconds,
            first_seen=cluster.first_seen,
            last_seen=cluster.last_seen,
            conversation_count=len(cluster.conversation_ids),
            sample_quotes=cluster.sample_quotes[:3],
            audio_sample_url=cluster.audio_sample_url,
            tags=cluster.tags,
            suggestion_name=cluster.suggestion_name,
            suggestion_person_id=cluster.suggestion_person_id,
        )
