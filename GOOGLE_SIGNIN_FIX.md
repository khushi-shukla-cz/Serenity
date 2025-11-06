# Google Sign-In Troubleshooting Guide

## 🔍 Issue Identified
Google Sign-In is not working because of missing Android OAuth configuration in Firebase.

## ✅ Your SHA-1 Fingerprint
```
SHA-1: 8A:69:67:B3:2B:70:35:4C:46:E6:7E:0A:AA:69:F7:12:CB:59:4D:2B
SHA-256: 68:30:23:C9:33:CA:3B:4B:E0:75:30:FB:E3:E1:68:75:DF:77:A7:42:89:0B:05:A1:CE:AD:62:87:5C:76:92:C0
```

## 🛠️ Step-by-Step Fix

### Step 1: Add SHA Fingerprints to Firebase Console

1. **Open Firebase Console**
   - Go to: https://console.firebase.google.com
   - Select project: **balance-8dcfa**

2. **Navigate to Project Settings**
   - Click the gear icon (⚙️) next to "Project Overview"
   - Click "Project Settings"

3. **Find Your Android App**
   - Scroll down to "Your apps" section
   - Find the Android app with package name: `bal.com`

4. **Add SHA Fingerprints**
   - Click "Add fingerprint" button
   - Paste this SHA-1: `8A:69:67:B3:2B:70:35:4C:46:E6:7E:0A:AA:69:F7:12:CB:59:4D:2B`
   - Click "Save"
   - Click "Add fingerprint" again
   - Paste this SHA-256: `68:30:23:C9:33:CA:3B:4B:E0:75:30:FB:E3:E1:68:75:DF:77:A7:42:89:0B:05:A1:CE:AD:62:87:5C:76:92:C0`
   - Click "Save"

### Step 2: Download Updated google-services.json

1. **In Firebase Console (same page)**
   - After adding SHA fingerprints, click **"Download google-services.json"**
   - This file will now contain Android OAuth client credentials

2. **Replace the Old File**
   - Save the downloaded file
   - Replace the file at: `android/app/google-services.json`
   - Make sure the new file is in the correct location

### Step 3: Enable Google Sign-In in Firebase Authentication

1. **Open Authentication Settings**
   - In Firebase Console, click "Authentication" in the left sidebar
   - Click "Sign-in method" tab

2. **Enable Google Provider**
   - Find "Google" in the providers list
   - Click on it
   - Toggle "Enable" switch to ON
   - Enter a support email (use your project email)
   - Click "Save"

### Step 4: Verify Configuration

The new `google-services.json` should contain something like this:

```json
"oauth_client": [
  {
    "client_id": "YOUR-PROJECT.apps.googleusercontent.com",
    "client_type": 1,
    "android_info": {
      "package_name": "bal.com",
      "certificate_hash": "8a6967b32b70354c46e67e0aaa69f712cb594d2b"
    }
  },
  {
    "client_id": "YOUR-PROJECT.apps.googleusercontent.com",
    "client_type": 3
  }
]
```

**Important:** Look for `"client_type": 1` - this is the Android client!

### Step 5: Test the Integration

1. **Completely Stop the App**
   - Close the app completely (not just minimize)
   - Stop the Flutter process

2. **Clean Build**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Rebuild and Run**
   ```bash
   flutter run
   ```

4. **Test Using Debug Screen**
   - Open the app
   - Navigate to Login Screen
   - Click the orange bug icon (🐛) in the top-right corner
   - Click "Test Sign-In" button
   - Watch the logs for detailed error messages

## 🐛 Using the Debug Screen

I've added a debug tool to help diagnose issues:

1. **Access Debug Screen:**
   - Go to Login Screen
   - Tap the orange bug icon in top-right corner

2. **Features:**
   - **Test Sign-In**: Full test of Google Sign-In flow with detailed logs
   - **Check Config**: Verify Google Sign-In configuration
   - **Live Logs**: Real-time status and error messages

3. **What to Look For:**
   - ✅ Green checkmarks = Success
   - ❌ Red X = Error
   - Read error messages carefully - they tell you what's wrong

## ❓ Common Errors & Solutions

### Error: "PlatformException(sign_in_failed)"
**Cause:** SHA-1 not added or google-services.json not updated
**Solution:** Complete Steps 1-2 above, then restart app completely

### Error: "ApiException: 10"
**Cause:** Google Sign-In not enabled in Firebase or incorrect configuration
**Solution:** Complete Step 3, ensure Google provider is enabled

### Error: "12500: Sign in failed"
**Cause:** App signing certificate doesn't match Firebase configuration
**Solution:** Verify SHA-1 matches exactly (spaces, colons, case-sensitive)

### Error: "A non-null String must be provided"
**Cause:** Missing client ID in google-services.json
**Solution:** Re-download google-services.json after adding SHA-1

### No Error, Just Returns Null
**Cause:** User cancelled, or Google Play Services issue
**Solution:** Check if Google Play Services is installed and up-to-date

## 📱 For Release Builds (Production)

When you're ready to release:

1. **Get Release SHA-1:**
   ```bash
   keytool -list -v -keystore YOUR_RELEASE_KEYSTORE.jks -alias YOUR_ALIAS
   ```

2. **Add Release SHA-1 to Firebase:**
   - Follow Step 1 above but with release SHA-1
   - Download new google-services.json
   - Build release APK

## ✅ Verification Checklist

Before testing, ensure:

- [ ] SHA-1 added to Firebase Console
- [ ] SHA-256 added to Firebase Console  
- [ ] Downloaded NEW google-services.json (after adding SHA)
- [ ] Replaced old google-services.json file
- [ ] Google Sign-In enabled in Firebase Authentication
- [ ] Support email added in Firebase Authentication
- [ ] App completely closed and restarted
- [ ] Run `flutter clean` and `flutter pub get`

## 🎯 Next Steps After Fix

Once Google Sign-In works:

1. **Remove Debug Button** (in production)
   - Edit `login_screen.dart`
   - Remove the debug IconButton with bug_report icon

2. **Test Thoroughly**
   - Test sign in
   - Test sign out
   - Test sign in again
   - Test app restart after sign in

3. **Test Edge Cases**
   - Cancel sign in
   - Sign in with different accounts
   - Network disconnection during sign in

## 📞 Still Having Issues?

If it still doesn't work after following all steps:

1. Use the Debug Screen to get detailed error logs
2. Check Firebase Console > Authentication > Users to see if user is created
3. Verify package name matches in:
   - `android/app/build.gradle` (applicationId)
   - `google-services.json` (package_name)
   - Firebase Console (Android app package name)

## 🔗 Useful Resources

- [Firebase Console](https://console.firebase.google.com)
- [Google Sign-In for Flutter](https://pub.dev/packages/google_sign_in)
- [Firebase Auth Package](https://pub.dev/packages/firebase_auth)
- [Flutter Firebase Setup Guide](https://firebase.google.com/docs/flutter/setup)
