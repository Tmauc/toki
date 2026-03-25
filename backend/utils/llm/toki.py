"""
TOKI — Custom LLM functions and prompts.

This module is Toki-specific and lives alongside Omi's existing LLM utilities.
It adds features not present in Omi:
  - Daily digest (résumé de journée)
  - Personal memory extraction (vie quotidienne, non pro)
  - Smart reminders (détection d'engagements implicites)
  - Relational memory (qui a dit quoi, contexte par personne)
  - Mood & sentiment tracking

All functions follow the same patterns as Omi's conversation_processing.py.
"""

import logging
from datetime import datetime, timezone
from typing import List, Optional

from langchain_core.output_parsers import PydanticOutputParser
from langchain_core.prompts import ChatPromptTemplate
from pydantic import BaseModel, Field

from .clients import llm_mini, llm_high

logger = logging.getLogger(__name__)


# ══════════════════════════════════════════════════════════════
# MODELS — Output structures
# ══════════════════════════════════════════════════════════════


class TokiReminder(BaseModel):
    """A smart reminder extracted from natural conversation."""

    description: str = Field(description="Ce qu'il faut faire ou rappeler, en langage clair")
    due_hint: Optional[str] = Field(
        default=None,
        description="Expression temporelle telle que mentionnée (ex: 'demain', 'lundi', 'dans une semaine'). None si aucune date mentionnée.",
    )
    due_iso: Optional[str] = Field(
        default=None,
        description="Date/heure résolue en ISO 8601 (YYYY-MM-DDTHH:MM:SS). None si impossible à déterminer.",
    )
    source_quote: Optional[str] = Field(
        default=None,
        description="Citation courte de la conversation d'où provient ce rappel (max 20 mots).",
    )
    person: Optional[str] = Field(
        default=None,
        description="Personne concernée par ce rappel, si identifiable.",
    )
    confidence: float = Field(
        default=0.8,
        ge=0.0,
        le=1.0,
        description="Niveau de confiance que c'est bien un engagement réel (0=incertain, 1=certain).",
    )


class TokiRemindersExtraction(BaseModel):
    reminders: List[TokiReminder] = Field(default_factory=list)


class TokiPersonMoment(BaseModel):
    """A notable moment involving a specific person."""

    person_name: str = Field(description="Nom ou identifier de la personne")
    summary: str = Field(description="Ce qui s'est passé / dit, en 1-2 phrases")
    topics: List[str] = Field(default_factory=list, description="Sujets abordés avec cette personne")
    sentiment: str = Field(default="neutral", description="Tonalité: positive / neutral / negative / mixed")


class TokiDailyDigest(BaseModel):
    """Structured summary of a full day."""

    headline: str = Field(description="Une phrase qui résume la journée (max 15 mots)")
    top_moments: List[str] = Field(
        default_factory=list,
        description="3 à 5 moments/événements marquants de la journée, chacun en 1 phrase",
    )
    people_seen: List[str] = Field(
        default_factory=list,
        description="Prénoms ou noms des personnes avec qui l'utilisateur a interagi aujourd'hui",
    )
    decisions_made: List[str] = Field(
        default_factory=list,
        description="Décisions importantes prises pendant la journée",
    )
    open_loops: List[str] = Field(
        default_factory=list,
        description="Choses non résolues, questions ouvertes, sujets à suivre",
    )
    mood_of_day: str = Field(
        default="neutral",
        description="Tonalité générale de la journée: great / good / neutral / difficult / rough",
    )
    mood_notes: Optional[str] = Field(
        default=None,
        description="Observation sur l'humeur/énergie, 1 phrase max. None si pas de signal clair.",
    )
    word_count: int = Field(default=0, description="Nombre approximatif de mots transcrits dans la journée")


class TokiPersonMemory(BaseModel):
    """A memory about a specific person in the user's life."""

    person_name: str
    fact: str = Field(description="Fait appris ou rappelé sur cette personne, max 20 mots")
    category: str = Field(
        default="general",
        description="Catégorie: family / friend / colleague / health / interest / opinion / project / other",
    )
    is_update: bool = Field(
        default=False,
        description="True si ce fait met à jour ou contredit une info connue antérieure",
    )


class TokiRelationalUpdate(BaseModel):
    """Relational context extracted from a conversation."""

    people_moments: List[TokiPersonMoment] = Field(default_factory=list)
    new_person_memories: List[TokiPersonMemory] = Field(default_factory=list)


class TokiMoodEntry(BaseModel):
    """Sentiment/mood extracted from a single conversation."""

    mood: str = Field(description="overall mood: great / good / neutral / tired / stressed / anxious / sad / angry")
    energy: str = Field(description="energy level: high / medium / low")
    signals: List[str] = Field(
        default_factory=list,
        description="Phrases ou mots de la conversation qui ont révélé cet état (max 3, 10 mots chacun)",
    )
    confidence: float = Field(default=0.7, ge=0.0, le=1.0)


# ══════════════════════════════════════════════════════════════
# PROMPTS & FUNCTIONS
# ══════════════════════════════════════════════════════════════


# ─── 1. SMART REMINDERS ─────────────────────────────────────

_reminders_parser = PydanticOutputParser(pydantic_object=TokiRemindersExtraction)

_reminders_prompt = ChatPromptTemplate.from_messages([
    (
        "system",
        """Tu es un assistant qui détecte les engagements et rappels implicites dans les conversations quotidiennes.

MISSION : Repérer tout ce que l'utilisateur ({user_name}) devra faire, vérifier ou suivre après cette conversation.

RÈGLES DE DÉTECTION :
Inclure :
✅ Engagements explicites ("je vais l'appeler", "je dois envoyer ça", "je rappelle demain")
✅ Promesses faites à quelqu'un ("je te tiens au courant", "je t'envoie le lien")
✅ Tâches mentionnées en passant ("faut que je pense à...")
✅ Rendez-vous ou échéances évoquées ("avant jeudi", "la semaine prochaine")
✅ Choses à ne pas oublier ("n'oublie pas de...", "pense à...")

Exclure :
❌ Choses déjà faites dans la conversation
❌ Projets vagues sans action concrète ("un jour peut-être...")
❌ Observations ou constats sans action ("le ciel est bleu")
❌ Rappels avec confiance < 0.5 (trop incertain)

RÉSOLUTION DES DATES :
- Date actuelle : {current_date}
- "demain" → résoudre en date ISO
- "lundi" → prochain lundi
- "dans une semaine" → +7 jours
- Si heure non précisée → mettre 09:00 par défaut
- Si vraiment impossible à résoudre → laisser due_iso à null

{format_instructions}""",
    ),
    (
        "human",
        """Conversation du {conversation_date} :

{transcript}

Extrait tous les rappels et engagements pour {user_name}.""",
    ),
])


def extract_toki_reminders(
    transcript: str,
    user_name: str,
    conversation_date: datetime,
) -> List[TokiReminder]:
    """
    Extract implicit commitments and reminders from a conversation transcript.
    Returns a list of TokiReminder objects, filtered by confidence > 0.5.
    """
    try:
        chain = _reminders_prompt | llm_mini | _reminders_parser
        result = chain.invoke({
            "user_name": user_name,
            "transcript": transcript[:6000],  # Limit context
            "conversation_date": conversation_date.strftime("%A %d %B %Y"),
            "current_date": conversation_date.strftime("%Y-%m-%d"),
            "format_instructions": _reminders_parser.get_format_instructions(),
        })
        return [r for r in (result.reminders or []) if r.confidence >= 0.5]
    except Exception as e:
        logger.error(f"[Toki] extract_toki_reminders error: {e}")
        return []


# ─── 2. DAILY DIGEST ─────────────────────────────────────────

_digest_parser = PydanticOutputParser(pydantic_object=TokiDailyDigest)

_digest_prompt = ChatPromptTemplate.from_messages([
    (
        "system",
        """Tu es l'assistant personnel de {user_name}. Chaque soir, tu crées un résumé structuré de sa journée à partir de ses conversations enregistrées.

TON RÔLE : Synthétiser la journée de manière chaleureuse et utile, comme un journal intime intelligent.

PRINCIPES :
- Sois concis mais captivant : chaque moment doit mériter d'être relu
- Identifie les vraies personnes par leur prénom quand possible (pas "Speaker 0")
- Les "open loops" sont les choses non résolues ou à suivre — elles sont importantes
- Le mood doit refléter le ressenti global, pas juste les mots positifs/négatifs
- Si la journée était banale, dis-le honnêtement (neutral est une réponse valide)
- Langue de réponse : même langue que les conversations (si en français → répondre en français)

{format_instructions}""",
    ),
    (
        "human",
        """Journée du {date} — Conversations de {user_name} :

{conversations_text}

---
Nombre total de mots transcrits : ~{word_count}
Nombre de conversations : {conversation_count}

Crée le résumé de journée.""",
    ),
])


def generate_daily_digest(
    conversations: List[dict],
    user_name: str,
    date: datetime,
) -> Optional[TokiDailyDigest]:
    """
    Generate a daily digest from a list of conversations.

    Args:
        conversations: list of dicts with keys 'title', 'overview', 'transcript', 'started_at'
        user_name: name of the user
        date: the day being summarized

    Returns:
        TokiDailyDigest or None on error
    """
    if not conversations:
        return None

    try:
        # Build a structured text from conversations
        parts = []
        word_count = 0
        for i, conv in enumerate(conversations, 1):
            title = conv.get("title", f"Conversation {i}")
            overview = conv.get("overview", "")
            started = conv.get("started_at", "")
            transcript = conv.get("transcript", "")
            word_count += len(transcript.split())

            part = f"[{i}] {title}"
            if started:
                part += f" ({started})"
            if overview:
                part += f"\nRésumé: {overview}"
            # Include a short excerpt of transcript (first 400 chars)
            if transcript:
                part += f"\nExtrait: {transcript[:400]}..."
            parts.append(part)

        conversations_text = "\n\n".join(parts)
        # Limit total context
        if len(conversations_text) > 12000:
            conversations_text = conversations_text[:12000] + "\n[...tronqué]"

        chain = _digest_prompt | llm_high | _digest_parser
        result = chain.invoke({
            "user_name": user_name,
            "date": date.strftime("%A %d %B %Y"),
            "conversations_text": conversations_text,
            "word_count": word_count,
            "conversation_count": len(conversations),
            "format_instructions": _digest_parser.get_format_instructions(),
        })
        result.word_count = word_count
        return result
    except Exception as e:
        logger.error(f"[Toki] generate_daily_digest error: {e}")
        return None


# ─── 3. RELATIONAL MEMORY ────────────────────────────────────

_relational_parser = PydanticOutputParser(pydantic_object=TokiRelationalUpdate)

_relational_prompt = ChatPromptTemplate.from_messages([
    (
        "system",
        """Tu es un assistant qui construit la mémoire relationnelle de {user_name}.
Chaque conversation peut enrichir sa connaissance des personnes qui l'entourent.

MISSION :
1. Identifier les moments notables avec chaque personne (people_moments)
2. Extraire des faits nouveaux ou mis à jour sur ces personnes (new_person_memories)

RÈGLES :
- Utilise les vrais prénoms quand connus — jamais "Speaker 0/1/2"
- Ne créer de souvenir sur quelqu'un que si l'info est UTILE pour se souvenir de lui/elle plus tard
- Catégories person_memory : family / friend / colleague / health / interest / opinion / project / other
- Pour sentiment : positive = bonne humeur, enthousiasme | negative = conflit, frustration | mixed = les deux
- Max 5 people_moments et 8 new_person_memories par conversation
- Si aucune personne identifiable → retourner des listes vides

{format_instructions}""",
    ),
    (
        "human",
        """Conversation du {date} :

{transcript}

Personnes connues de {user_name} (pour référence) :
{known_people}

Extrais les informations relationnelles.""",
    ),
])


def extract_relational_memory(
    transcript: str,
    user_name: str,
    conversation_date: datetime,
    known_people: Optional[List[str]] = None,
) -> Optional[TokiRelationalUpdate]:
    """
    Extract relational context from a conversation.
    Identifies who said what, their mood, topics discussed, and new facts about them.

    Args:
        transcript: the conversation transcript
        user_name: name of the user
        conversation_date: when the conversation happened
        known_people: list of known people names (for context)

    Returns:
        TokiRelationalUpdate or None on error
    """
    try:
        known_str = ", ".join(known_people) if known_people else "aucune (première conversation)"

        chain = _relational_prompt | llm_mini | _relational_parser
        result = chain.invoke({
            "user_name": user_name,
            "transcript": transcript[:5000],
            "date": conversation_date.strftime("%d/%m/%Y à %H:%M"),
            "known_people": known_str,
            "format_instructions": _relational_parser.get_format_instructions(),
        })
        return result
    except Exception as e:
        logger.error(f"[Toki] extract_relational_memory error: {e}")
        return None


# ─── 4. MOOD & SENTIMENT ─────────────────────────────────────

_mood_parser = PydanticOutputParser(pydantic_object=TokiMoodEntry)

_mood_prompt = ChatPromptTemplate.from_messages([
    (
        "system",
        """Tu es un assistant discret qui observe l'état émotionnel et l'énergie de {user_name} à travers ses conversations.

MISSION : Déduire le mood et l'énergie de {user_name} uniquement à partir de ses prises de parole.

RÈGLES :
- Analyse UNIQUEMENT ce que {user_name} dit, pas les autres personnes
- Indices de mood positif : enthousiasme, rires, projets excitants, énergie dans la voix
- Indices de mood négatif : fatigue, plaintes, frustration, monotonie, ton plat
- Énergie HIGH : parle vite, de nombreux sujets, initiatives | LOW : réponses courtes, passive
- Si tu n'as pas assez d'info → confidence = 0.3, mood = neutral
- Ne pas inventer : les signals doivent être des citations réelles

Moods disponibles : great / good / neutral / tired / stressed / anxious / sad / angry

{format_instructions}""",
    ),
    (
        "human",
        """Conversation du {date} :

{transcript}

Quel est l'état de {user_name} dans cette conversation ?""",
    ),
])


def extract_mood(
    transcript: str,
    user_name: str,
    conversation_date: datetime,
) -> Optional[TokiMoodEntry]:
    """
    Extract mood and energy level from a conversation.

    Returns:
        TokiMoodEntry or None on error
    """
    try:
        chain = _mood_prompt | llm_mini | _mood_parser
        result = chain.invoke({
            "user_name": user_name,
            "transcript": transcript[:4000],
            "date": conversation_date.strftime("%d/%m/%Y à %H:%M"),
            "format_instructions": _mood_parser.get_format_instructions(),
        })
        return result if result.confidence >= 0.4 else None
    except Exception as e:
        logger.error(f"[Toki] extract_mood error: {e}")
        return None


# ─── 5. PERSONAL MEMORY EXTRACTION ───────────────────────────

_personal_memory_categories = [
    "famille",
    "amis",
    "sante",
    "alimentation",
    "sport",
    "loisirs",
    "apprentissage",
    "projets_perso",
    "opinions",
    "habitudes",
    "voyages",
    "achats",
    "autres",
]

TOKI_PERSONAL_MEMORY_PROMPT = """
Tu es un curateur de mémoire personnelle pour {user_name}. Contrairement à un assistant professionnel,
tu te concentres sur la VIE QUOTIDIENNE : famille, amis, santé, habitudes, loisirs, opinions.

MISSION : Extraire les informations sur {user_name} qui seront utiles à se rappeler dans les semaines ou mois qui viennent.

CATÉGORIES (choisir la plus pertinente) :
- famille : faits sur les membres de la famille
- amis : faits sur les amis
- sante : santé physique ou mentale de {user_name}
- alimentation : préférences, régimes, découvertes culinaires
- sport : activités sportives, objectifs, performances
- loisirs : films, livres, musique, jeux, hobbies
- apprentissage : choses apprises, curiosités, centres d'intérêt
- projets_perso : projets personnels (pas pro) en cours
- opinions : avis, valeurs, positions sur des sujets
- habitudes : routines, rituels, comportements récurrents
- voyages : destinations visitées ou prévues, expériences de voyage
- achats : achats importants faits ou planifiés
- autres : tout ce qui a de la valeur et ne rentre pas ailleurs

RÈGLES :
✅ Max 10 mots par souvenir
✅ Formuler comme un fait intemporel ("{user_name} aime...")
✅ Utiliser les vrais prénoms des proches (jamais "Speaker 0")
✅ Ne PAS extraire : banalités, discussions impersonnelles, faits généraux sur le monde
✅ Ne PAS extraire : ce que les AUTRES ont dit (ça va dans INTERESTING si utile, pas ici)

EXEMPLES :
✅ "{user_name} court 3x par semaine le matin avant le travail"
✅ "{user_name} est allergique aux arachides"
✅ "{user_name} déteste les openspaces, préfère le télétravail"
✅ "{user_name} lit des romans de SF le week-end"
❌ "A discuté de la météo" (banal)
❌ "Les réunions c'est important" (pas un fait sur {user_name})
"""
