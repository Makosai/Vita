import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/widget/button_icon.dart';

class SidebarFlatButton extends StatelessWidget {
  SidebarFlatButton({
    this.onPressed,
    required this.iconName,
    this.text = "",
  });

  final Function()? onPressed;
  final String iconName;
  final String text;

  final ButtonStyle flatButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(CurrentTheme.btnNeutral),
    foregroundColor: MaterialStateProperty.all<Color>(CurrentTheme.textPrimary),
    padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.fromLTRB(
        Sizing.padding1,
        Sizing.padding2,
        Sizing.padding1,
        Sizing.padding2,
      ),
    ),
  );

  final TextStyle activeWeight = TextStyle(fontWeight: FontWeight.w800);
  final TextStyle inactiveWeight = TextStyle(fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        Sizing.padding5,
        Sizing.padding3,
        Sizing.padding5,
        Sizing.padding3,
      ),
      child: ButtonIcon(
        onPressed: onPressed,
        iconName: iconName,
        text: text,
        iconHeight: Sizing.icon1,
        iconColor: CurrentTheme.textPrimary,
        style: flatButtonStyle,
        textPadding: EdgeInsets.fromLTRB(Sizing.padding4, 0, 0, 0),
        textStyle: activeWeight,
      ),
    );
  }
}
