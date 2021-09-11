import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';

class InboxContent extends StatelessWidget {
  InboxContent({required this.getInbox});

  final List<Widget> Function() getInbox;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: CurrentTheme.content,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(Sizing.padding3),
          child: ListView(
            children: getInbox(),
            addAutomaticKeepAlives: false,
            cacheExtent: 100.0,
          ),
        ),
      ),
    );
  }
}
