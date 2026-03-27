# Toki 時 — Ma mémoire augmentée

> **Toki** (時) signifie "temps" en japonais. Ce projet capture les moments de ta vie pour les transformer en une mémoire personnelle, interrogeable et actionnable.

Toki est un fork personnel d'[Omi](https://github.com/BasedHardware/omi), le wearable IA open-source. L'objectif est de construire un device discret (collier, lunettes, boucle d'oreille) qui enregistre ta vie au quotidien et te sert de seconde mémoire.

---

## 🎯 Vision du projet

Un micro wearable ultra-compact connecté en BLE à ton smartphone, qui :

- Enregistre en continu ce que tu dis et ce qui est dit autour de toi
- Transcrit et structure automatiquement tes conversations
- Te permet de retrouver n'importe quelle conversation via une recherche sémantique
- Reconnaît les voix de tes proches pour savoir qui t'a dit quoi
- Extrait automatiquement des rappels, tâches et événements calendrier
- Génère des résumés de ta journée
- Construit une mémoire relationnelle (qui, quoi, quand)

---

## 🔀 Relation avec Omi (upstream)

Ce repo est un fork de [BasedHardware/omi](https://github.com/BasedHardware/omi).

| Remote | URL | Rôle |
|---|---|---|
| `origin` | `https://github.com/Tmauc/toki` | Ton fork — tes modifications |
| `upstream` | `https://github.com/BasedHardware/omi` | Omi officiel — les MAJ |

```bash
# Récupérer les mises à jour d'Omi
git fetch upstream
git log HEAD..upstream/main --oneline  # voir ce qui a changé
git merge upstream/main
git push origin main
```

> **Bonne pratique** : merger toutes les 2-4 semaines pour éviter la divergence.

---

## 🏗️ Structure du projet

```
/
├── app/                  # App Flutter (iOS + Android)
├── backend/              # Backend FastAPI (Python)
│   ├── routers/toki_voice_personas.py
│   ├── utils/speaker_clustering.py
│   ├── utils/toki_retroactive.py
│   └── utils/llm/toki.py       # Prompts & fonctions LLM custom Toki
├── deploy/               # Docker-compose, .env.template, setup-vm.sh
├── firmware/             # Firmware device (C/C++, nRF/ESP32)
└── docs/toki/            # Documentation Toki
    ├── README.md         # Index et statut du projet
    ├── deploy.md         # Guide de déploiement backend
    ├── hardware.md       # Assemblage du wearable DIY
    └── voice-personas/
        └── ROADMAP.md    # Spec complète Voice Personas
```

---

## ✨ Features Toki (vs Omi de base)

| Feature | Statut | Notes |
|---|---|---|
| **Voice Personas** | ✅ Terminé (phases A→F) | [ROADMAP](docs/toki/voice-personas/ROADMAP.md) |
| **Rebranding Omi → Toki** | ✅ Terminé | App, backend, iOS, textes |
| **Nettoyage codebase** | ✅ Terminé | Monétisation, marketplace, analytics, phone calls supprimés |
| **Chat tab** | ✅ Terminé | Navbar 4 tabs : Home / Tasks / Memories / Chat |
| **Usage Statistics** | ✅ Terminé | Page avec graphes fl_chart + tabs période |
| **Smart Reminders** | ✅ Prompts écrits | Pas encore hookés dans le pipeline |
| **Daily Digest** | ✅ Prompts écrits | Cron job à créer |
| **Relational Memory** | ✅ Prompts écrits | Branché sur le pipeline LLM existant |
| **Mood Tracking** | ✅ Prompts écrits | Branché sur le pipeline LLM existant |
| **Backend deployable** | ✅ Stack prête | docker-compose + Fly.io / Hetzner |
| **Hardware DIY** | 🔜 Composants commandés | [Guide](docs/toki/hardware.md) |
| **Backend en prod** | 🔜 En cours | [Guide deploy](docs/toki/deploy.md) |
| **Smart Reminders (branché)** | 🔜 Planifié | Hook dans pipeline post-transcription |
| **Daily Digest (cron)** | 🔜 Planifié | Cron job soir |
| **Analytics relationnels** | 🔜 Planifié | Graphe social, stats par personne |
| **Mode full local** | 🔜 Planifié | Aucune donnée en cloud |

---

## 🚀 Démarrage

→ **Backend** : voir [docs/toki/deploy.md](docs/toki/deploy.md)
→ **Hardware** : voir [docs/toki/hardware.md](docs/toki/hardware.md)
→ **App** : voir le [README.md](./README.md) d'Omi pour le setup Flutter

---

*Fork maintenu par [@Tmauc](https://github.com/Tmauc) — mis à jour : 2026-03-27*
