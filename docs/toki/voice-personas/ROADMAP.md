# Voice Personas — Plan de conception & Roadmap

> Feature inspirée de "Personnes" dans Apple Photos.
> Les voix inconnues sont automatiquement clusterisées et présentées à l'utilisateur qui peut les nommer ou les supprimer.

![Architecture & Roadmap](./design.png)

---

## Vision

Quand Toki enregistre une voix qu'il ne reconnaît pas, il ne la jette pas — il la garde dans une liste "Voix non identifiées". Chaque voix est regroupée par similarité (même inconnue apparaissant dans plusieurs conversations = 1 cluster). L'utilisateur peut à tout moment ouvrir cette liste, écouter un extrait, lire des citations, et nommer la voix. Une fois nommée, **toutes** les conversations passées sont rétroactivement taguées.

---

## Architecture

### Pipeline de traitement

```
Audio chunk
  ↓
Diarizer (pyannote) → Speaker 0 / Speaker 1 / Speaker 2...
  ↓
Extraction embedding vocal (512-dim) par segment
  ↓
Comparaison cosinus contre people/{id}/embeddings (seuil 0.82)
  ├── MATCH → segment tagué avec person_id (prénom connu)
  └── NO MATCH
        ↓
        Comparaison contre unknown_speakers/{cluster_id}/embeddings (seuil 0.75)
        ├── MATCH cluster → ajout au cluster, mise à jour centroid
        └── NO MATCH → nouveau cluster "Inconnu #N"
```

### Algorithme de clustering

- **Représentation** : centroid mobile (moyenne de N embeddings)
  → Robuste aux variations de qualité audio (téléphone vs micro direct)
- **Seuil cosinus** : 0.75 pour clustering, 0.82 pour matching personnes connues
- **Seuil contexte** : ajustable selon l'environnement (bruyant = seuil abaissé)
- **Merge** : si deux clusters s'avèrent être la même personne → fusion manuelle

---

## Modèle de données

### `users/{uid}/unknown_speakers/{cluster_id}`

```json
{
  "id": "cluster_abc123",
  "uid": "user_xyz",
  "status": "unknown",          // unknown | named | deleted
  "display_name": null,         // null jusqu'au naming
  "person_id": null,            // lien vers people/{id} après naming

  "embeddings": [[...], [...]], // plusieurs vecteurs 512-dim
  "embedding_count": 5,

  "first_seen": "2026-03-20T09:14:00Z",
  "last_seen": "2026-03-25T18:32:00Z",
  "total_segments": 47,
  "total_duration_seconds": 183.5,

  "conversation_ids": ["conv_1", "conv_2", "conv_7"],

  "sample_quotes": [
    {
      "text": "t'as vu le match hier soir ?",
      "conversation_id": "conv_1",
      "timestamp": "2026-03-20T09:14:22Z"
    }
  ],

  "audio_sample_url": "gs://toki-speech-profiles/clusters/cluster_abc123.wav",

  "created_at": "2026-03-20T09:14:00Z",
  "updated_at": "2026-03-25T18:32:00Z"
}
```

### `users/{uid}/people/{person_id}` (étendu depuis Omi)

Champs ajoutés par Toki :
```json
{
  "speaker_cluster_id": "cluster_abc123",
  "embeddings": [[...], [...]],
  "first_conversation_at": "2026-03-20T09:14:00Z",
  "total_conversations": 14,
  "tags": ["famille", "ami"]
}
```

---

## API Endpoints

Tous sous le préfixe `/v1/toki/voice-personas`

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Liste tous les clusters de l'utilisateur (`status=unknown`) |
| GET | `/{id}` | Détail d'un cluster + liste de ses conversations |
| GET | `/{id}/audio` | URL signée pour l'audio sample (5s) |
| POST | `/{id}/name` | Nommer un cluster → déclenche retroactive update |
| POST | `/{id}/merge/{other_id}` | Fusionner deux clusters confondus |
| DELETE | `/{id}` | Supprimer un cluster (status → deleted) |

### Payload POST `/{id}/name`
```json
{
  "name": "Papa",
  "person_id": null,          // null = créer nouvelle personne
  "tags": ["famille"]
}
```

---

## Retroactive Update

Déclenché à chaque naming. Exécuté en tâche background (non bloquant).

```python
# Ordre d'exécution dans utils/toki_retroactive.py
1. Créer people/{id} (ou lier si person_id fourni)
2. Mettre à jour cluster: status → "named", person_id renseigné
3. Batch update Firestore: conversations où cluster_id apparaît
   → remplacer cluster_id par person_id dans transcript_segments[]
4. Batch update Pinecone: metadata people[] pour chaque vecteur concerné
5. Push notification: "Papa identifié dans 23 conversations"
```

---

## Fichiers à créer / modifier

### Nouveaux fichiers (Toki-spécifique, pas de conflit upstream)

| Fichier | Rôle |
|---------|------|
| `backend/models/unknown_speakers.py` | Modèles Pydantic : `UnknownSpeakerCluster`, `SampleQuote`, `NamingRequest` |
| `backend/database/unknown_speakers.py` | CRUD Firestore pour les clusters |
| `backend/utils/speaker_clustering.py` | Logique cosinus, centroid, matching |
| `backend/routers/toki_voice_personas.py` | Endpoints API |
| `backend/utils/toki_retroactive.py` | Batch update post-naming |
| `app/lib/pages/toki/voice_personas_page.dart` | Écran "Voix non identifiées" |
| `app/lib/pages/toki/name_persona_page.dart` | Flow de naming |
| `app/lib/widgets/voice_persona_card.dart` | Card individuelle |

### Fichiers Omi à modifier (modifications minimales, risque conflit faible)

| Fichier | Modification |
|---------|-------------|
| `backend/utils/speaker_identification.py` | Appeler `speaker_clustering.py` quand pas de match dans `people/` |
| `backend/routers/transcribe.py` | Déclencher clustering async après chaque segment inconnu |
| `backend/main.py` | Inclure le nouveau router `toki_voice_personas` |

---

## Roadmap

### Phase A — Modèles & DB `3-4 jours`
- [ ] `models/unknown_speakers.py` : `UnknownSpeakerCluster`, `SampleQuote`, `NamingRequest`, `MergeRequest`
- [ ] `database/unknown_speakers.py` : `create_cluster()`, `get_clusters_for_user()`, `get_cluster_by_id()`, `update_cluster_centroid()`, `add_conversation_to_cluster()`, `assign_name_to_cluster()`, `merge_clusters()`, `delete_cluster()`
- [ ] Firestore indexes + security rules
- [ ] Tests unitaires des modèles

### Phase B — Logique de clustering `4-5 jours`
- [ ] `utils/speaker_clustering.py` : `compute_cosine_similarity()`, `find_best_cluster_match()`, `merge_embeddings_centroid()`, `should_create_new_cluster()`, `extract_sample_quote()`
- [ ] Hook dans `utils/speaker_identification.py` : appel clustering quand pas de match dans `people/`
- [ ] Tâche background async (FastAPI `BackgroundTasks`) pour extraction sample_quotes
- [ ] Upload audio sample (5s) vers GCS bucket `BUCKET_SPEECH_PROFILES`
- [ ] Tests : clustering avec embeddings réels, cas limite (voix similaires)

### Phase C — API Endpoints `2-3 jours`
- [ ] `routers/toki_voice_personas.py` avec les 6 endpoints décrits
- [ ] Auth middleware (uid depuis Firebase token)
- [ ] Validation des payloads (Pydantic)
- [ ] Gestion d'erreurs et edge cases
- [ ] Inclure router dans `main.py`

### Phase D — Flutter UI `5-6 jours`
- [ ] `voice_personas_page.dart` : grid de cards, tri par nb apparitions
- [ ] `voice_persona_card.dart` : nom temporaire, stats, sample quotes, bouton play
- [ ] Player audio intégré pour écouter l'extrait vocal
- [ ] `name_persona_page.dart` : input nom, recherche contacts, preview conversations
- [ ] Intégration dans `conversation_detail` : speaker "?" avec tap → naming flow
- [ ] Provider Riverpod/Provider pour état des clusters
- [ ] Notifications in-app lors du retroactive update

### Phase E — Retroactive Update `2 jours`
- [ ] `utils/toki_retroactive.py` : `batch_update_conversations()`, `update_pinecone_metadata()`, `send_naming_notification()`
- [ ] Job async non bloquant avec progress tracking
- [ ] Push notification FCM post-naming
- [ ] Gestion des erreurs partielle (rollback si échec)

### Phase F — Refinements `continu`
- [ ] Split cluster : séparer deux voix confondues dans un même cluster
- [ ] Suggestion automatique : "Cette voix ressemble à Papa ?" (matching partiel)
- [ ] Ajustement seuil dynamique par contexte (bruyant/silencieux)
- [ ] Analytics : carte sociale des voix ("Tu parles le plus avec...")
- [ ] Mode confidentialité : pas de stockage audio samples
- [ ] Export / backup données vocales chiffrées

---

## Cas limites à gérer

| Cas | Solution |
|-----|----------|
| Cluster pollué (2 voix confondues) | Feature "Diviser" en Phase F |
| Seuil inadapté (café bruyant) | Seuil contextuel ajustable |
| Dérive embedding (qualité audio) | Centroid sur 5+ échantillons |
| Appels téléphoniques (codec différent) | Seuil distinct pour appels |
| Privacy RGPD | Audio chiffrés, suppression totale possible |
| Même personne, appareils différents | Embeddings multi-sources dans le cluster |

---

## Statut

| Phase | Statut | Notes |
|-------|--------|-------|
| A — Modèles & DB | 🔜 À faire | Prochaine étape |
| B — Clustering | 🔜 À faire | Dépend de A |
| C — API | 🔜 À faire | Dépend de A+B |
| D — Flutter UI | 🔜 À faire | Dépend de C |
| E — Retroactive Update | 🔜 À faire | Dépend de C+D |
| F — Refinements | 🔜 À faire | Continu |

---

*Document maintenu par [@Tmauc](https://github.com/Tmauc) — dernière mise à jour : 2026-03-25*
