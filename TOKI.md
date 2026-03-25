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

### Récupérer les mises à jour d'Omi

```bash
# 1. Récupérer les nouveautés d'Omi
git fetch upstream

# 2. Voir ce qui a changé
git log HEAD..upstream/main --oneline

# 3. Merger dans ta branche principale
git merge upstream/main

# 4. Résoudre les éventuels conflits, puis push
git push origin main
```

> **Bonne pratique** : faire ce merge régulièrement (toutes les 2-4 semaines) pour éviter une divergence trop importante.

### En cas de conflit

Les fichiers les plus susceptibles de créer des conflits sont ceux qu'on modifie dans Toki. Si un conflit apparaît :

```bash
# Voir les fichiers en conflit
git status

# Après résolution manuelle des conflits
git add <fichier>
git merge --continue
```

---

## 🏗️ Structure du projet

```
/
├── app/                  # App Flutter (iOS + Android)
├── backend/              # Backend FastAPI (Python)
│   └── utils/llm/toki.py # Prompts & fonctions LLM custom Toki
├── deploy/               # Scripts VM Proxmox (docker-compose, .env.template, setup.sh)
├── firmware/             # Firmware du device (C/C++, nRF/ESP32)
├── docs/toki/            # Documentation Toki-spécifique
│   └── voice-personas/   # Feature: clustering vocal style Apple Photos
│       ├── ROADMAP.md    # Plan de conception complet
│       └── design.png    # Schéma architecture
├── plugins/              # Intégrations tierces
└── TOKI.md               # Ce fichier
```

---

## ✨ Features custom Toki (vs Omi de base)

| Feature | Statut | Doc | Description |
|---|---|---|---|
| **Voice Personas** | 🔜 Phase A | [ROADMAP](docs/toki/voice-personas/ROADMAP.md) | Clustering voix inconnues style Apple Photos |
| **Smart Reminders** | ✅ Prompts écrits | — | Détection engagements implicites + due dates |
| **Daily Digest** | ✅ Prompts écrits | — | Résumé structuré de journée (cron soir) |
| **Relational Memory** | ✅ Prompts écrits | — | Qui a dit quoi + faits sur les proches |
| **Mood Tracking** | ✅ Prompts écrits | — | Sentiment et énergie par conversation |
| **Personal Memory** | ✅ Prompts écrits | — | Mémoire vie perso (vs pro-oriented Omi) |
| Analytics relationnels | 🔜 Planifié | — | Graphe social, stats par personne |
| Mode full local | 🔜 Planifié | — | Aucune donnée en cloud |

---

## 🚀 Installation & Setup

Voir le [README.md](./README.md) d'Omi pour l'installation complète.

Pour les features spécifiques à Toki, une documentation dédiée sera ajoutée dans `/docs/toki/`.

---

## 📝 Contribution

Ce repo est personnel. Si tu veux contribuer à l'écosystème Omi en général, préfère contribuer directement à [BasedHardware/omi](https://github.com/BasedHardware/omi).

---

*Fork maintenu par [@Tmauc](https://github.com/Tmauc)*
