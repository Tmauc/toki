"""
TOKI — Custom LLM functions and prompts.

This module is Toki-specific and lives alongside Omi's existing LLM utilities.
It adds features not present in Omi:
  - Personal memory extraction (vie quotidienne, non pro)
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


class TokiPersonMoment(BaseModel):
    """A notable moment involving a specific person."""

    person_name: str = Field(description="Nom ou identifier de la personne")
    summary: str = Field(description="Ce qui s'est passé / dit, en 1-2 phrases")
    topics: List[str] = Field(default_factory=list, description="Sujets abordés avec cette personne")
    sentiment: str = Field(default="neutral", description="Tonalité: positive / neutral / negative / mixed")


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


# ─── 1. RELATIONAL MEMORY ────────────────────────────────────

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


# ─── 2. MOOD & SENTIMENT ─────────────────────────────────────

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


# ─── 3. PERSONAL MEMORY EXTRACTION ───────────────────────────

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
