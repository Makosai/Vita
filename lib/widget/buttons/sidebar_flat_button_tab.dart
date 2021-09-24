import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/widget/button_icon_tab.dart';

class SidebarButtonTab extends StatelessWidget {
  const SidebarButtonTab({
    this.onPressed,
    required this.isSelected,
    required this.iconName,
    this.text = "",
  });

  final Function()? onPressed;
  final bool isSelected;
  final String iconName;
  final String text;

  static final ButtonStyle flatTabStyle = TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    primary: CurrentTheme.textSecondary,
    padding: EdgeInsets.symmetric(vertical: Sizing.padding3),
  );

  static const TextStyle inactiveWeight = TextStyle(
      fontWeight: FontWeight.w400);
  static const TextStyle activeWeight = TextStyle(fontWeight: FontWeight.w800);

  @override
  Widget build(BuildContext context) {
    return ButtonIconTab(
      onPressed: onPressed,
      isSelected: isSelected,
      iconName: iconName,
      hasDotOnSelected: true,
      text: text,
      iconHeight: Sizing.icon1,
      iconColor: CurrentTheme.textSecondary,
      style: flatTabStyle,
      textPadding: const EdgeInsets.fromLTRB(Sizing.padding4, 0, 0, 0),
      textStyle: inactiveWeight,
    );
  }
}
