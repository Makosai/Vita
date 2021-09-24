import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/widget/button_icon.dart';

class SidebarFlatButton extends StatelessWidget {
  const SidebarFlatButton({
    this.onPressed,
    required this.iconName,
    this.text = "",
  });

  final Function()? onPressed;
  final String iconName;
  final String text;

  static final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: CurrentTheme.btnNeutral,
    primary: CurrentTheme.textPrimary,
    padding: EdgeInsets.symmetric(vertical: Sizing.padding2),
  );

  static const TextStyle activeWeight = TextStyle(fontWeight: FontWeight.w800);
  static const TextStyle inactiveWeight =
      TextStyle(fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Sizing.padding5,
        vertical: Sizing.padding3,
      ),
      child: ButtonIcon(
        onPressed: onPressed,
        iconName: iconName,
        text: text,
        iconHeight: Sizing.icon1,
        iconColor: CurrentTheme.textPrimary,
        style: flatButtonStyle,
        textPadding: const EdgeInsets.fromLTRB(Sizing.padding5, 0, 0, 0),
        textStyle: activeWeight,
      ),
    );
  }
}
