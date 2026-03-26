# Setup Troubleshooting Guide

Recap of all issues encountered and fixes applied when setting up the Toki project locally (macOS 26 Tahoe, Xcode 16.4, Flutter 3.35.3 via fvm, Python 3.11).

---

## Daily Launch Commands

### 1. Backend (terminal 1)
```bash
cd backend
source venv/bin/activate
brew services start redis  # if not already running
GOOGLE_APPLICATION_CREDENTIALS=/Users/mauc/Repo/Personnelle/mobiles/toki/backend/google-credentials.json \
GOOGLE_CLOUD_PROJECT=toki-57d35 \
DYLD_LIBRARY_PATH=/opt/homebrew/lib \
uvicorn main:app --reload --env-file .env --port 8000
```

### 2. Ngrok (terminal 2)
```bash
ngrok http --url=picked-candi-punchily.ngrok-free.dev 8000
```

### 3. Flutter App (terminal 3)
```bash
cd app
# Pre-copy Flutter.framework if missing (required on macOS 26 Tahoe)
[ ! -d ios/Flutter/Flutter.framework ] && cp -R ~/fvm/versions/3.35.3/bin/cache/artifacts/engine/ios/Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework ios/Flutter/Flutter.framework
# Launch on simulator
fvm flutter run --flavor dev -d DECA4883-DC88-41B1-97E1-93AD44B13961
```

### Simulator management
```bash
# Boot simulator
xcrun simctl boot DECA4883-DC88-41B1-97E1-93AD44B13961 && open -a Simulator
# Reset simulator (if needed)
xcrun simctl shutdown DECA4883-DC88-41B1-97E1-93AD44B13961 && xcrun simctl erase DECA4883-DC88-41B1-97E1-93AD44B13961
```

### Xcode version swap
```bash
# Use Xcode 16.4 (for Flutter builds)
sudo xcode-select -s /Applications/Xcode-16.4.0.app/Contents/Developer
# Use Xcode 26 (for Homebrew installs or other)
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

---

## First-Time Setup

### Prerequisites
```bash
brew install python@3.11 opus libogg redis ffmpeg xcodes fvm
brew services start redis
xcodes install 16.4
sudo xcodes select 16.4
xcodebuild -downloadPlatform iOS
```

### Backend setup
```bash
cd backend
python3.11 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Google credentials
gcloud auth login
gcloud config set project toki-57d35
gcloud auth application-default login --project toki-57d35
cp ~/.config/gcloud/application_default_credentials.json google-credentials.json

# Copy .env from template and fill in API keys
cp .env.template .env
```

### Flutter app setup
```bash
cd app
fvm install 3.35.3
fvm use 3.35.3
fvm flutter precache --ios
fvm flutter pub get
cd ios && pod install && cd ..

# Pre-copy Flutter.framework (macOS 26 workaround)
cp -R ~/fvm/versions/3.35.3/bin/cache/artifacts/engine/ios/Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework ios/Flutter/Flutter.framework
```

### Firebase project setup (toki-57d35)
Required Google Cloud APIs to enable:
- Cloud Firestore API
- Cloud Storage API
- Cloud Translation API (optional, for live translation)

Required Firebase setup:
- Authentication > Google Sign-In enabled
- Firestore database created (Native mode, test rules)
- Storage bucket created (`BUCKET_SPEECH_PROFILES` in `.env`)

Firestore composite indexes are created automatically — click the links in backend error logs when they appear.

---

## Troubleshooting

### 1. `Flutter/Flutter.h` file not found (macOS 26 Tahoe)

**Error:** `'Flutter/Flutter.h' file not found` — bridging header fails during Xcode build.

**Root cause:** On macOS 26 (Tahoe beta), the build system compiles the bridging header **before** the `xcode_backend.sh` Run Script phase copies `Flutter.framework` into the build directory. This happens regardless of Xcode version (tested with both Xcode 16.4 and 26.3).

**Fix:** Pre-copy `Flutter.framework` into `app/ios/Flutter/` before building:
```bash
cp -R ~/fvm/versions/3.35.3/bin/cache/artifacts/engine/ios/Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework app/ios/Flutter/Flutter.framework
```

This needs to be done once (or after `flutter clean`). The framework is in `.gitignore` so it won't be committed.

### 2. Flutter version mismatch

**Issue:** The project requires Flutter 3.35.3, but newer versions (e.g., 3.41.4) cause build failures.

**Fix:** Use `fvm` (Flutter Version Management):
```bash
fvm install 3.35.3
fvm use 3.35.3
fvm flutter precache --ios
```

Always prefix Flutter commands with `fvm`:
```bash
fvm flutter pub get
fvm flutter run --flavor dev
```

### 3. Xcode version

**Issue:** Xcode 26 (beta) is not yet supported by Flutter. Use Xcode 16.4 (stable).

**Fix:**
```bash
xcodes install 16.4
sudo xcodes select 16.4
```

### 4. iOS Simulator runtime missing

**Error:** `iOS 18.5 is not installed`

**Fix:**
```bash
xcodebuild -downloadPlatform iOS
```

### 5. Python 3.9 too old for dependencies

**Error:** `No matching distribution found for ipython==8.26.0`

**Fix:** Recreate venv with Python 3.11:
```bash
cd backend
rm -rf venv
python3.11 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

### 6. Google credentials setup

**Error:** `Project was not passed and could not be determined from the environment.`

**Fix:**
```bash
gcloud auth login
gcloud config set project toki-57d35
gcloud auth application-default login --project toki-57d35
cp ~/.config/gcloud/application_default_credentials.json backend/google-credentials.json
```

### 7. Redis not configured

**Error:** `ValueError: invalid literal for int() with base 10: ''`

**Fix:**
```bash
brew install redis
brew services start redis
```
In `.env`:
```
REDIS_DB_HOST=localhost
REDIS_DB_PORT=6379
REDIS_DB_PASSWORD=
```

### 8. Opus / libogg libraries not found

**Error:** `Could not find Opus library` or `NameError: name 'c_int_p' is not defined`

**Fix:**
```bash
brew install opus libogg
```

Patch PyOgg bug — add `c_int_p = POINTER(c_int)` after `opus_int32_p = POINTER(opus_int32)` in:
`venv/lib/python3.11/site-packages/pyogg/opus.py`

Launch backend with: `DYLD_LIBRARY_PATH=/opt/homebrew/lib`

### 9. Silero VAD download — GitHub 401

**Error:** `HTTPError: HTTP Error 401: Unauthorized`

**Fix:** Add `GITHUB_TOKEN=ghp_xxxxx` to `.env` (create at https://github.com/settings/tokens, no scopes needed).

### 10. Typesense (optional)

**Error:** `ConfigError: 'api_key' is not defined.`

**Fix:** Typesense is optional. Set placeholders in `.env`:
```
TYPESENSE_HOST=localhost
TYPESENSE_HOST_PORT=8108
TYPESENSE_API_KEY=placeholder
```

### 11. Pinecone index

**Error:** `ValueError: Either name or host must be specified`

**Fix:** Create a Pinecone serverless index (dimensions: 3072, metric: cosine, AWS us-east-1), then set in `.env`:
```
PINECONE_API_KEY=your-key
PINECONE_INDEX_NAME=your-index-name
```

### 12. Firebase project mismatch

**Error:** `Firebase ID token has incorrect "aud" claim. Expected "toki-57d35" but got "based-hardware-dev"`

**Root cause:** The app's `GoogleService-Info.plist` and `firebase_options_dev.dart` must point to the same Firebase project as the backend (`toki-57d35`).

**Fix:**
1. Download `GoogleService-Info.plist` from Firebase Console for project `toki-57d35`
2. Place in `app/ios/Config/Dev/GoogleService-Info.plist`
3. Update `app/lib/firebase_options_dev.dart` with the correct `projectId`, `appId`, `apiKey`, `messagingSenderId`
4. Update `app/ios/Flutter/Custom.xcconfig` with the correct `GOOGLE_REVERSE_CLIENT_ID`

### 13. Firestore indexes missing

**Error:** `The query requires an index. You can create it here: ...`

**Fix:** Click the URL in the error message — it opens Firebase Console and auto-creates the index. Wait 2-3 minutes for it to build.

### 14. Google Cloud APIs disabled

**Error:** `Cloud Firestore API has not been used in project toki-57d35 before or it is disabled`

**Fix:** Enable required APIs in Google Cloud Console:
- Firestore: https://console.developers.google.com/apis/api/firestore.googleapis.com/overview?project=toki-57d35
- Storage: https://console.developers.google.com/apis/api/storage.googleapis.com/overview?project=toki-57d35
- Translation: https://console.developers.google.com/apis/api/translate.googleapis.com/overview?project=toki-57d35

---

## Current Configuration

| Component | Value |
|-----------|-------|
| Firebase Project | `toki-57d35` |
| App Bundle ID (dev) | `com.toki.ios.dev` |
| App Bundle ID (base) | `com.toki.ios` |
| Flutter version | 3.35.3 (via fvm) |
| Xcode version | 16.4 |
| Python version | 3.11 |
| Ngrok URL | `https://picked-candi-punchily.ngrok-free.dev/` |
| Backend port | 8000 |
| Simulator ID | `DECA4883-DC88-41B1-97E1-93AD44B13961` (iPhone 16e) |
