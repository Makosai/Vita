import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vita/routes/home/home.dart';

class Globals {
  static const projectName = "Vita";
}

class Security {
  final storage = new FlutterSecureStorage();

  late final String tokens;

  Security() {
    tokens = loadTokens() as String;
  }

  Future<String?> loadTokens() async {
    return await storage.read(key: "tokens");
  }
// Todo: The tokens should be optionally encrypted.
//  A password or key may be provided to decrypt them.
//  Optionally, the user can opt to have the tokens always
//  decrypted on access so it's never decrypted in memory.
// This option may be more resource intensive and potentially
// annoying as it would require a password or key to be entered
// everytime the program requires the token again.
}

class Settings {
  static onGenerateRoute(settings, Widget? page) {
    if(page != null) {
      return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => page,
          transitionDuration: Duration(seconds: 0)
      );
    }

    return MaterialPageRoute(builder: (_) => HomePage());
  }
}