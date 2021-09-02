import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleUserAccount {
  late String email;
  late String id;
  late String? displayName;
  late String? photoUrl;

  GoogleUserAccount(GoogleSignInAccount user) {
    email = user.email;
    id = user.id;
    displayName = user.displayName;
    photoUrl = user.photoUrl;
  }
}

class AuthGoogleTemplate extends StatelessWidget {
  AuthGoogleTemplate({ this.user, required this.handleSignIn, required this.handleSignOut});

  final GoogleUserAccount? user;
  final Function() handleSignIn;
  final Function() handleSignOut;

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    GoogleUserAccount? user = this.user;

    if(user != null) {
      return SizedBox.expand(
        child: Column(
          children: [
            Text("Welcome, ${user.displayName ?? 'user'}!"),
            TextButton(onPressed: handleSignOut, child: Text('Sign out'))
          ],
        ),
      );
    }
    return SizedBox.expand(
      child: Column(
        children: [
          Text("Sign in to begin."),
          TextButton(onPressed: handleSignIn, child: Text('Sign in'))
        ],
      )
    );
  }


}