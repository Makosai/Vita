import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vita/widget/sidebar.dart';

class ScaffoldWrap extends StatelessWidget {
  ScaffoldWrap({required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return Scaffold(
        body: SafeArea(
          child: Sidebar(content: content),
        ),
      );
    }

    return Scaffold(
      drawer: Sidebar(content: null),
      body: SafeArea(
        child: Sidebar(content: content),
      ),
    );
  }
}
