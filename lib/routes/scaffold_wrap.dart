import 'package:flutter/material.dart';
import 'package:vita/utils/helpers.dart';
import 'package:vita/widget/sidebar.dart';

class ScaffoldWrap extends StatelessWidget {
  ScaffoldWrap({required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    print('Scaff: ${ModalRoute.of(context)!.isCurrent}');
    List<Widget> children = [content];

    if (isDesktop) {
      children.insert(0, Sidebar());
    }

    return Scaffold(
      drawer: isDesktop ? null : Sidebar(),
      body: SafeArea(
        child: Row(children: children),
      ),
    );
  }
}
