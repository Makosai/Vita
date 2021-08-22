import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/utils/icons.dart';
import 'package:vita/widget/shapes/rounded_half_box.dart';

class ButtonIconTab extends StatelessWidget {
  ButtonIconTab(
      {this.onPressed,
      required this.iconName,
      this.text = "",
      this.height,
      this.width,
      this.iconHeight,
      this.iconWidth,
      this.iconColor,
      this.style,
      this.textPadding = EdgeInsets.zero,
      this.textStyle});

  final Function()? onPressed;
  final String iconName;
  final String text;
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final Color? iconColor;
  final ButtonStyle? style;
  final EdgeInsets textPadding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RoundedHalfBox(
              width: 3, height: 30.0, curve: 3.0, color: CurrentTheme.textInfo),
          Container(
            width: iconWidth ?? 0.0 + 20.0,
            height: 30.0,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: Sizing.padding3),
            child: getSvg(
              type: 'icons',
              name: iconName,
              height: iconHeight,
              width: iconWidth,
              color: iconColor,
            ),
          ),
          Padding(
            padding: textPadding,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ],
      ),
      style: style,
    );
  }
}
