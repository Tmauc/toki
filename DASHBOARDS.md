# Toki — Liens Dashboards & Configs

Tous les dashboards et consoles pour gérer le projet Toki.

---

## Google Cloud / Firebase (projet `toki-57d35`)

| Service | URL |
|---------|-----|
| **Firebase Console** (vue générale) | https://console.firebase.google.com/project/toki-57d35 |
| **Firebase Auth** (utilisateurs, providers) | https://console.firebase.google.com/project/toki-57d35/authentication |
| **Firestore Database** (collections, données) | https://console.firebase.google.com/project/toki-57d35/firestore |
| **Firestore Indexes** (index composites) | https://console.firebase.google.com/project/toki-57d35/firestore/indexes |
| **Firebase Storage** (fichiers, buckets) | https://console.firebase.google.com/project/toki-57d35/storage |
| **Firebase Crashlytics** | https://console.firebase.google.com/project/toki-57d35/crashlytics |
| **Firebase Settings** (apps, SDK config) | https://console.firebase.google.com/project/toki-57d35/settings/general |
| **Google Cloud Console** (APIs, billing) | https://console.cloud.google.com/home/dashboard?project=toki-57d35 |
| **APIs activées** | https://console.cloud.google.com/apis/dashboard?project=toki-57d35 |
| **Cloud Firestore API** | https://console.cloud.google.com/apis/api/firestore.googleapis.com/overview?project=toki-57d35 |
| **Cloud Storage API** | https://console.cloud.google.com/apis/api/storage.googleapis.com/overview?project=toki-57d35 |
| **Cloud Translation API** | https://console.cloud.google.com/apis/api/translate.googleapis.com/overview?project=toki-57d35 |
| **OAuth Credentials** (client IDs) | https://console.cloud.google.com/apis/credentials?project=toki-57d35 |
| **Cloud Storage Buckets** | https://console.cloud.google.com/storage/browser?project=toki-57d35 |
| **IAM & Permissions** | https://console.cloud.google.com/iam-admin/iam?project=toki-57d35 |
| **Billing** | https://console.cloud.google.com/billing?project=toki-57d35 |

---

## Services Externes (clés dans `backend/.env`)

| Service | Dashboard | Variable `.env` | Status |
|---------|-----------|-----------------|--------|
| **OpenAI** | https://platform.openai.com/settings/organization/billing | `OPENAI_API_KEY` | Configuré |
| **Deepgram** (transcription) | https://console.deepgram.com | `DEEPGRAM_API_KEY` | Configuré |
| **Pinecone** (vector DB) | https://app.pinecone.io | `PINECONE_API_KEY` | Configuré (index: `toki`) |
| **Hugging Face** | https://huggingface.co/settings/tokens | `HUGGINGFACE_TOKEN` | Configuré |
| **GitHub** (token pour Silero VAD) | https://github.com/settings/tokens | `GITHUB_TOKEN` | Configuré |
| **Ngrok** | https://dashboard.ngrok.com | — | URL: `picked-candi-punchily.ngrok-free.dev` |
| **Redis** | Local (`localhost:6379`) | `REDIS_DB_HOST/PORT` | Local via Homebrew |
| **Typesense** | Placeholder (non configuré) | `TYPESENSE_*` | Placeholder |
| **Soniox** | https://console.soniox.com | `SONIOX_API_KEY` | Non configuré |
| **LangSmith** | https://smith.langchain.com | `LANGSMITH_API_KEY` | Non configuré |
| **Stripe** | https://dashboard.stripe.com | `STRIPE_API_KEY` | Non configuré |
| **Twilio** | https://console.twilio.com | `TWILIO_*` | Non configuré |
| **Perplexity** | https://www.perplexity.ai/settings/api | `PERPLEXITY_API_KEY` | Non configuré |
| **Hume AI** | https://platform.hume.ai | `HUME_API_KEY` | Non configuré |

---

## Outils Dev Locaux

| Outil | Commande / Lien |
|-------|-----------------|
| **Xcode 16.4** | `/Applications/Xcode-16.4.0.app` — `sudo xcodes select 16.4` |
| **Xcode 26** | `/Applications/Xcode.app` — `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer` |
| **Flutter 3.35.3** (fvm) | `fvm flutter --version` |
| **iOS Simulator** (iPhone 16e) | `xcrun simctl boot DECA4883-DC88-41B1-97E1-93AD44B13961` |
| **Redis** | `brew services start redis` / `redis-cli ping` |
| **Python venv** | `cd backend && source venv/bin/activate` |

---

## Apple Developer

| Service | URL |
|---------|-----|
| **Apple Developer Account** | https://developer.apple.com/account |
| **Certificates & Profiles** | https://developer.apple.com/account/resources/certificates |
| **App IDs** | https://developer.apple.com/account/resources/identifiers |
| **Devices** | https://developer.apple.com/account/resources/devices |

---

## Repo & Docs

| Ressource | URL |
|-----------|-----|
| **Toki repo (fork)** | https://github.com/Tmauc/toki |
| **Omi upstream** | https://github.com/BasedHardware/omi |
| **Omi docs** | https://docs.omi.me |
| **Omi backend setup** | https://docs.omi.me/doc/developer/backend/Backend_Setup |
| **Omi app setup** | https://docs.omi.me/doc/developer/AppSetup |
