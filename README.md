# SideStall — Real-Time Live Video Marketplace, OTP Auth & Founder CRM

SideStall is a zero-build, real-time multi-user live commerce marketplace with **6-digit OTP verification for both Email and Phone**, **WebRTC live camera streaming**, **cross-device discovery**, and a private **Owner CRM Vault (`#crm`)**.

## 1. Deploy to Firebase Hosting & Firestore

```bash
unzip -o ~/Downloads/SideStall-firebase.zip -d "/Users/danielbredenhand/Documents/SideStall"
cd "/Users/danielbredenhand/Documents/SideStall"
chmod +x deploy.sh && ./deploy.sh
```

`./deploy.sh` automatically exports your Firebase Web SDK config into `public/firebase-config.json` ([Understand the default Hosting site](https://firebase.google.com/docs/hosting/default-site)), deploys Hosting ([Get started with Firebase Hosting](https://firebase.google.com/docs/hosting/quickstart)), and publishes `firestore.rules` ([Manage and deploy Security Rules](https://firebase.google.com/docs/rules/manage-deploy)). All users also sync immediately across devices via the built-in [MQTT.js](https://github.com/mqttjs/mqtt.js/) TLS WebSocket relay.

## 2. Live Email OTP & Phone SMS OTP Delivery

- **Phone SMS OTP:** Enable **Phone** under **Firebase Console → Build → Authentication → Sign-in method** ([Authenticate with a Phone Number Using JavaScript](https://firebase.google.com/docs/auth/web/phone-auth)), or paste any custom SMS/WhatsApp webhook URL inside **🔒 CRM → Cloud & Security**.
- **Free Live Email OTP (via your Gmail):** Open **🔒 CRM → Cloud & Security → Email & Phone OTP Gateways**, click **Copy Free Gmail OTP Script**, paste it into a new project at `https://script.google.com` (**Deploy → New deployment → Web app → Who has access: Anyone**), and save the Web App URL in CRM. Every user across every device will immediately receive real 6-digit OTP emails in their inbox.
