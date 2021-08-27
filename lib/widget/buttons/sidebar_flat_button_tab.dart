import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/widget/button_icon_tab.dart';

class SidebarButtonTab extends StatelessWidget {
  SidebarButtonTab({
    this.onPressed,
    required this.isSelected,
    required this.iconName,
    this.text = "",
  });

  final Function()? onPressed;
  final bool Function() isSelected;
  final String iconName;
  final String text;

  final ButtonStyle flatTabStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    foregroundColor:
        MaterialStateProperty.all<Color>(CurrentTheme.textSecondary),
    padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.fromLTRB(
        0,
        Sizing.padding3,
        0,
        Sizing.padding3,
      ),
    ),
  );

  final TextStyle inactiveWeight = TextStyle(fontWeight: FontWeight.w400);
  final TextStyle activeWeight = TextStyle(fontWeight: FontWeight.w800);

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
