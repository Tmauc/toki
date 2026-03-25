#!/bin/bash
# ============================================================
# TOKI — Script de setup VM Proxmox (Ubuntu 22.04 / Debian 12)
# Usage: bash setup-vm.sh
# ============================================================

set -e
TOKI_DIR="$HOME/repos/toki"

echo ""
echo "=============================="
echo "  TOKI — Setup VM"
echo "=============================="

# ─── 1. Mise à jour système ───
echo "[1/8] Mise a jour systeme..."
sudo apt-get update -qq && sudo apt-get upgrade -y -qq

# ─── 2. Dépendances de base ───
echo "[2/8] Installation dependances..."
sudo apt-get install -y -qq \
  git curl wget unzip \
  ca-certificates gnupg lsb-release \
  build-essential ffmpeg

# ─── 3. Docker ───
echo "[3/8] Installation Docker..."
if ! command -v docker &> /dev/null; then
  curl -fsSL https://get.docker.com | bash
  sudo usermod -aG docker "$USER"
  echo "  -> Docker installe. IMPORTANT: se deconnecter/reconnecter pour le groupe docker."
else
  echo "  -> Docker deja installe ($(docker --version))"
fi

# ─── 4. Docker Compose ───
echo "[4/8] Verification Docker Compose..."
if ! docker compose version &> /dev/null; then
  sudo apt-get install -y docker-compose-plugin
fi
echo "  -> $(docker compose version)"

# ─── 5. NVIDIA drivers (si GPU disponible) ───
echo "[5/8] Verification GPU NVIDIA..."
if command -v nvidia-smi &> /dev/null; then
  echo "  -> GPU detecte: $(nvidia-smi --query-gpu=name --format=csv,noheader 2>/dev/null)"
  # NVIDIA Container Toolkit pour Docker
  if ! dpkg -l | grep -q nvidia-container-toolkit; then
    echo "  -> Installation NVIDIA Container Toolkit..."
    distribution=$(. /etc/os-release; echo $ID$VERSION_ID)
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
    curl -s -L "https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list" | \
      sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
      sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list > /dev/null
    sudo apt-get update -qq
    sudo apt-get install -y -qq nvidia-container-toolkit
    sudo systemctl restart docker
  fi
  echo "  -> NVIDIA Container Toolkit pret"
else
  echo "  -> Pas de GPU NVIDIA detecte. Le service diarizer sera desactive."
  echo "     (speaker identification basique uniquement)"
fi

# ─── 6. Clone / update repo Toki ───
echo "[6/8] Clone du repo Toki..."
if [ -d "$TOKI_DIR" ]; then
  echo "  -> Repo existant, mise a jour..."
  cd "$TOKI_DIR" && git pull origin main
else
  git clone git@github.com:Tmauc/toki.git "$TOKI_DIR"
fi
cd "$TOKI_DIR"

# ─── 7. Préparer .env ───
echo "[7/8] Configuration .env..."
if [ ! -f "deploy/.env" ]; then
  cp deploy/.env.template deploy/.env
  echo ""
  echo "  !! IMPORTANT: Editer deploy/.env avec tes clés API avant de continuer !!"
  echo "     nano deploy/.env"
  echo ""
  echo "  Clés OBLIGATOIRES pour un premier lancement:"
  echo "    - FIREBASE_PROJECT_ID + FIREBASE_API_KEY + FIREBASE_AUTH_DOMAIN"
  echo "    - SERVICE_ACCOUNT_JSON (ou fichier service-account.json dans deploy/)"
  echo "    - OPENAI_API_KEY"
  echo "    - DEEPGRAM_API_KEY"
  echo "    - PINECONE_API_KEY + PINECONE_INDEX_NAME"
  echo "    - ADMIN_KEY (générer: openssl rand -hex 32)"
  echo "    - ENCRYPTION_SECRET (générer: openssl rand -hex 32)"
  echo ""
else
  echo "  -> .env deja present"
fi

# ─── 8. Résumé ───
echo "[8/8] Setup termine !"
echo ""
echo "=============================="
echo "  Prochaines etapes:"
echo "=============================="
echo ""
echo "  1. Editer les variables:"
echo "     nano $TOKI_DIR/deploy/.env"
echo ""
echo "  2. (Si Firebase service account JSON)"
echo "     cp /path/to/serviceAccount.json $TOKI_DIR/deploy/service-account.json"
echo ""
echo "  3. Lancer la stack (SANS le diarizer si pas de GPU):"
echo "     cd $TOKI_DIR/deploy"
echo "     docker compose up -d redis pusher backend"
echo ""
echo "  4. Lancer AVEC le diarizer (si GPU):"
echo "     docker compose up -d"
echo ""
echo "  5. Vérifier que tout tourne:"
echo "     docker compose ps"
echo "     curl http://localhost:8080/health"
echo ""
echo "  6. Logs en direct:"
echo "     docker compose logs -f backend"
echo ""
