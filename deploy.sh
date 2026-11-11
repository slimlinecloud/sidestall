#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

echo "==> 1/3 Linking Firebase Web SDK config into public/firebase-config.json..."
if firebase apps:sdkconfig web --json > /tmp/ss_sdkcfg.json 2>/dev/null; then
  cp /tmp/ss_sdkcfg.json public/firebase-config.json
  echo "    Fetched existing Firebase Web App config."
else
  echo "    Creating Firebase Web App 'SideStall'..."
  firebase apps:create web SideStall >/dev/null 2>&1 || true
  if firebase apps:sdkconfig web --json > /tmp/ss_sdkcfg.json 2>/dev/null; then
    cp /tmp/ss_sdkcfg.json public/firebase-config.json
    echo "    Generated public/firebase-config.json."
  else
    echo "    Note: Could not auto-fetch sdkconfig (Global WSS Live Relay will still sync all users immediately!)."
  fi
fi
rm -f /tmp/ss_sdkcfg.json

echo "==> 2/3 Deploying SideStall to Firebase Hosting..."
firebase deploy --only hosting

echo "==> 3/3 Deploying Cloud Firestore Security Rules (if Firestore is created)..."
firebase deploy --only firestore:rules || echo "    (Optional) Create Cloud Firestore in Firebase Console -> Build -> Firestore Database, then run: firebase deploy --only firestore:rules"

echo "==> Done! Open your live URL on two devices to test real-time stalls & live streams."
