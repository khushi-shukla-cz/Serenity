@echo off
echo ================================================
echo     Google Sign-In Configuration Helper
echo ================================================
echo.

echo Step 1: Getting your SHA-1 and SHA-256 fingerprints...
echo.
keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android | findstr "SHA1 SHA256"
echo.
echo ================================================
echo.

echo Step 2: What to do next:
echo.
echo 1. Copy the SHA-1 and SHA-256 values above
echo 2. Go to: https://console.firebase.google.com
echo 3. Select project: balance-8dcfa
echo 4. Click gear icon (Settings) - Project Settings
echo 5. Scroll to "Your apps" section
echo 6. Find Android app (bal.com)
echo 7. Click "Add fingerprint"
echo 8. Paste SHA-1, click Save
echo 9. Click "Add fingerprint" again
echo 10. Paste SHA-256, click Save
echo 11. Download NEW google-services.json
echo 12. Replace android/app/google-services.json
echo.

echo Step 3: Enable Google Sign-In
echo.
echo 1. In Firebase Console, click "Authentication"
echo 2. Click "Sign-in method" tab
echo 3. Click "Google" provider
echo 4. Toggle "Enable" to ON
echo 5. Add support email
echo 6. Click "Save"
echo.

echo Step 4: Rebuild app
echo.
echo Run these commands:
echo    flutter clean
echo    flutter pub get
echo    flutter run
echo.
echo Then test using the debug button (bug icon) on login screen!
echo.

echo ================================================
echo For detailed instructions, see: GOOGLE_SIGNIN_FIX.md
echo ================================================
echo.

pause
