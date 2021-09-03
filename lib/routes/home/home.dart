import 'package:flutter/material.dart';
import 'package:vita/theme/globals.dart';
import 'package:vita/theme/mail/auth_google.dart';

import '../scaffold_wrap.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = Globals.projectName;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrap(content: AuthGoogle());
  }
}
