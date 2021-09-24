import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/widget/button_icon_tab.dart';

class FlatButtonTab extends StatelessWidget {
  FlatButtonTab({
    this.onPressed,
    required this.isSelected,
    required this.iconName,
    this.text = "",
  });

  final Function()? onPressed;
  final bool isSelected;
  final String iconName;
  final String text;

  final ButtonStyle flatTabStyle = TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    primary: CurrentTheme.textTertiary,
    padding: EdgeInsets.symmetric(vertical: Sizing.padding3),
  );

  static const TextStyle inactiveWeight = TextStyle(fontWeight: FontWeight.w400);
  static const TextStyle activeWeight = TextStyle(fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    return ButtonIconTab(
      onPressed: onPressed,
      isSelected: isSelected,
      iconName: iconName,
      text: text,
      iconHeight: Sizing.icon1,
      iconColor: CurrentTheme.textSecondary,
      style: flatTabStyle,
      textPadding: EdgeInsets.fromLTRB(Sizing.padding4, 0, 0, 0),
      textStyle: inactiveWeight,
    );
  }
}
