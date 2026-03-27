# Toki — Guide de déploiement backend

---

## Stack

```
backend (FastAPI)  ←→  redis  ←→  pusher (WebSocket relay)
                              ↕
                      diarizer (pyannote, GPU optionnel)
                              ↕
                  Firestore + Deepgram + Pinecone (APIs externes)
```

---

## Option A — Fly.io (recommandé pour commencer, gratuit)

Fly.io supporte Docker nativement, free tier généreux (3 VMs), datacenter EU disponible.

```bash
# Installer flyctl
curl -L https://fly.io/install.sh | sh

# Login
fly auth login

# Depuis le dossier deploy/
fly launch         # génère fly.toml automatiquement
fly deploy

# Vérifier
fly status
fly logs
```

**Limites free tier :** 3 VMs shared-cpu-1x 256MB. Suffisant pour backend + redis + pusher.

---

## Option B — Hetzner CX22 (~4€/mois)

Meilleur choix si tu veux une VM dédiée stable. Datacenter Frankfurt/Helsinki.

### 1. Créer la VM

- Type : **CX22** (2 vCPU / 4 GB RAM / 40 GB SSD)
- OS : Ubuntu 24.04
- Région : Nuremberg ou Helsinki
- Ajouter ta clé SSH publique

### 2. Setup automatique

```bash
# Sur la VM fraîche (depuis ton terminal local)
ssh root@<IP_VM>
bash <(curl -s https://raw.githubusercontent.com/Tmauc/toki/main/deploy/setup-vm.sh)
```

Le script installe Docker, clone le repo, configure le système.

### 3. Configurer les variables

```bash
cd ~/repos/toki/deploy
cp .env.template .env
nano .env
```

### 4. Lancer les services

```bash
# Sans GPU (transcription via Deepgram API)
docker compose up -d redis pusher backend

# Avec GPU (diarisation locale)
docker compose up -d

# Vérifier
docker compose ps
curl http://localhost:8080/health
```

---

## Option C — Modal (diariseur uniquement)

Modal est utilisé **uniquement pour le service de diarisation** — pas pour le backend entier.

Avantage : GPU à la demande, **$30/mois de crédits gratuits** (largement suffisant pour usage perso).

```bash
pip install modal
modal deploy backend/modal_diarizer.py
```

Le backend principal appelle Modal via HTTP quand il a besoin de séparer les voix.

---

## Comptes à créer avant le lancement

| Service | Variables | Usage |
|---|---|---|
| Firebase | `FIREBASE_*` + `service-account.json` | Auth + Firestore |
| Deepgram | `DEEPGRAM_API_KEY` | Speech-to-text |
| Pinecone | `PINECONE_API_KEY`, `PINECONE_INDEX_NAME` | Recherche sémantique |
| OpenAI / Anthropic | `OPENAI_API_KEY` | LLM (résumés, mémoires) |

---

## Exposition publique (pour que l'app mobile puisse joindre le backend)

```bash
# Option 1 : reverse proxy nginx + certbot (HTTPS)
apt install nginx certbot python3-certbot-nginx
certbot --nginx -d toki.votredomaine.com

# Option 2 : Fly.io gère le HTTPS automatiquement

# Mettre à jour l'URL dans l'app Flutter
# app/lib/utils/constants.dart → apiBaseUrl
```

---

*Mis à jour : 2026-03-27*
