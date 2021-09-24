import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis_auth/googleapis_auth.dart';
import "package:http/http.dart" as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:vita/configs/config_auth_google.dart';
import 'package:vita/theme/hive/boxes/account_info.dart';
import 'package:vita/utils/helpers.dart';

class Google {
  // Configs
  static var _id =
      ClientId(GoogleInfo.DESKTOP_CLIENT_ID, GoogleInfo.DESKTOP_CLIENT_SECRET);
  static var _scopes = ['https://mail.google.com/'];

  static void signIn() {
    /*var accessToken = AccessToken('Bearer', 'testdata', DateTime.now().toUtc());
    AccountInfo.createGoogleAccount('testGoogleAccount@gmail.com', accessToken, null, null);
    AccountInfo.createEmailAccount('testEmailAccount@hotmail.com', 'password');

    if(accessToken.data != "f") {
      return;
    }*/

    if (isDesktop) {
      void prompt(String url) async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }

      var client = http.Client();
      obtainAccessCredentialsViaUserConsent(_id, _scopes, client, prompt)
          .then((AccessCredentials credentials) {
// Access credentials are available in [credentials].
// ...
        print("Credentials: ${credentials.accessToken.data}");
        getProfile(credentials.accessToken.data).then((value) {
          String? emailAddress = value['emailAddress'] as String?;

          if(emailAddress == null) {
            return;
          }

          AccountInfo.createGoogleAccount(
            emailAddress,
            credentials.accessToken,
            credentials.refreshToken,
            credentials.idToken,
          );
        });

        client.close();
      });
    } else {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        clientId: GoogleInfo.ANDROID_CLIENT_ID,
        scopes: <String>[
          'email',
          'https://mail.google.com/',
        ],
      );

      // Mobile
      _googleSignIn.signIn();
    }
  }

  static Future<Map<String, dynamic>> getProfile(String accessToken) async {
    var res = await getApi(
        accessToken, "www.googleapis.com", "/gmail/v1/users/me/profile");
    print("body: ${res.body}");
    print("res: $res");

    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> getInbox(String accessToken) async {
    var res = await getApi(
        accessToken, "www.googleapis.com", "/gmail/v1/users/me/messages");
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  static Future<http.Response> getApi(
    String accessToken,
    String authority,
    String unencodedPath, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    var client = http.Client();

    var res = await client.get(
      Uri.https(authority, unencodedPath, {"q": "in:inbox"}),
      headers: {
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json",
      },
    );

    return res;
  }
}
