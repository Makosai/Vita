import 'package:flutter/material.dart';
import 'package:vita/widget/button_icon.dart';

class DesktopAppBar extends StatelessWidget {
  DesktopAppBar({
    this.title = "",
    this.actions,
  });

  final String title;
  final List<Widget>? actions;

  Widget build(BuildContext context) {
    return Row(children: [
      ButtonIcon(
        iconName: 'chevron-left',
        onPressed: () {},
      ),
      Align(alignment: Alignment.centerRight, child: Row(children: actions ?? [],))
    ]);
  }
}
