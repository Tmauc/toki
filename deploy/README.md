# Toki — Deploy

Scripts de déploiement. Voir le guide complet dans [docs/toki/deploy.md](../docs/toki/deploy.md).

## Fichiers

| Fichier | Description |
|---|---|
| `setup-vm.sh` | Script d'installation complet (Docker, NVIDIA, clone repo) |
| `docker-compose.yml` | Stack complète : backend + pusher + diarizer + redis |
| `.env.template` | Toutes les variables d'environnement commentées |
| `.env` | Ton fichier de config (à créer depuis `.env.template`, **ne pas committer**) |
| `service-account.json` | Clé Firebase (**ne pas committer**) |

## Démarrage rapide

```bash
# 1. Sur la VM fraîche
bash <(curl -s https://raw.githubusercontent.com/Tmauc/toki/main/deploy/setup-vm.sh)

# 2. Remplir les variables
cd ~/repos/toki/deploy
cp .env.template .env
nano .env

# 3. Lancer (sans GPU)
docker compose up -d redis pusher backend

# 4. Lancer (avec GPU pour diarisation)
docker compose up -d

# 5. Vérifier
docker compose ps
curl http://localhost:8080/health
```

## Comptes à créer avant le lancement

| Service | URL | Variables |
|---|---|---|
| Firebase | console.firebase.google.com | `FIREBASE_*`, `SERVICE_ACCOUNT_JSON` |
| OpenAI | platform.openai.com | `OPENAI_API_KEY` |
| Deepgram | console.deepgram.com | `DEEPGRAM_API_KEY` |
| Pinecone | app.pinecone.io | `PINECONE_API_KEY`, `PINECONE_INDEX_NAME` |

## Notes

- Le service `diarizer` nécessite un GPU NVIDIA. Sans GPU, le lancer séparément ou le désactiver.
- En local/dev, `FAIR_USE_ENABLED=false` est recommandé.
- Les secrets `.env` et `service-account.json` sont dans `.gitignore`.
