import 'dart:async';

import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vita/configs/config_auth_google.dart';
import 'package:vita/theme/mail/auth_google_template.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis_auth/googleapis_auth.dart';

var _id =
    ClientId(GoogleInfo.DESKTOP_CLIENT_ID, GoogleInfo.DESKTOP_CLIENT_SECRET);
var _scopes = ['https://mail.google.com/'];

class AuthGoogleDesktop extends StatefulWidget {
  @override
  State createState() => _AuthGoogleDesktopState();
}

class _AuthGoogleDesktopState extends State<AuthGoogleDesktop> {
  Future<void> _handleSignIn() async {
    var client = http.Client();
    obtainAccessCredentialsViaUserConsent(_id, _scopes, client, prompt)
        .then((AccessCredentials credentials) {
// Access credentials are available in [credentials].
// ...
      print(credentials);

      client.close();
    });
  }

  void prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _handleSignOut() async {}

  @override
  Widget build(BuildContext context) {
    return AuthGoogleTemplate(
        handleSignIn: _handleSignIn, handleSignOut: _handleSignOut);
  }
}
