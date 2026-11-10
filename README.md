# SideStall — Firebase Hosting Deployment Package

This folder is pre-configured for [Firebase Hosting](https://firebase.google.com/docs/hosting) following the official [Get started with Firebase Hosting](https://firebase.google.com/docs/hosting/quickstart) and [Configure Hosting behavior](https://firebase.google.com/docs/hosting/full-config) specifications.

## Included Files
- `public/index.html` — Self-contained SideStall web app (checkout cart, local storage persistence, unlocked Pro creator hub, responsive light/dark styling)
- `public/404.html` — Fallback not-found page
- `firebase.json` — Static hosting configuration with single-page app rewrite rules
- `.firebaserc` — Project alias mapping file

## Deploy in 3 Steps
1. Install the Firebase CLI (requires Node.js) and sign in per [Get started with Firebase Hosting](https://firebase.google.com/docs/hosting/quickstart):
   ```bash
   npm install -g firebase-tools
   firebase login
   ```
2. Unzip this folder, open a terminal inside it, and link your Firebase project ID:
   ```bash
   firebase use --add
   ```
   *(Select an existing project created in the Firebase Console, or pass `--project YOUR_PROJECT_ID` directly in step 3.)*
3. Deploy to [Firebase Hosting](https://firebase.google.com/docs/hosting/quickstart):
   ```bash
   firebase deploy --only hosting
   ```
