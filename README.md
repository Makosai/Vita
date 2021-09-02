# vita

A multi-platform open-source mail application built in Flutter for Windows, Mac, Linux, Android, and iOS.

## Getting Started
This guide is for those wanting to build the program themselves.
### General Setup
1. Put your Google Client ID and Secret in the `lib/configs/config_auth.google.dart` file.
2. This file should be ignored for changes, but double check that you're not committing it to a public git repo.

### Android Setup
Option A: Follow this [video](https://www.youtube.com/watch?v=E5WgU6ERZzA).
Option B: Follow this loose text-guide.
1. Register a new project for OAuth on the Google Cloud Platform [here](https://console.cloud.google.com/apis/credentials/consent).
2. Create a keystore. Preferably naming the keystore 'vita-upload-keystore.jks' and the alias 'vitaupload'. Set the passwords to "mainpassword" or read step 2a.
Mac/Linux: ` keytool -genkey -v -keystore ./vita-upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias vitaupload`
Windows: ` keytool -genkey -v -keystore .\vita-upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias vitaupload`
2a. If you choose a different name or password, be sure to go inside of android/app/build.gradle and change it to whatever you've entered.
3. Create credentials in the same place you created your OAuth (there's a tab on the left side that says Credentials, followed by a button at the top that says create).
3a. Add `com.quaintstudios.vita` as the package name and you can get the SHA-1 fingerprint by either following the command they give you or navigating to the android folder and running the following command:
    Mac/Linux: `./gradle signingReport`
    Windows: `gradlew.bat signingReport`
4. Scroll to the top of the signing report and copy the SHA1 for variant: debug / Config: debug. Paste it into the Cloud Platform then press CREATE.
