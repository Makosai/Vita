import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vita/routes/home/home.dart';

class Globals {
  static const projectName = "Vita";
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