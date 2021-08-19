import 'package:flutter/material.dart';
import 'package:vita/utils/icons.dart';

class ButtonIcon extends StatelessWidget {
  ButtonIcon({
    this.onPressed,
    required this.iconName,
    this.text = "",
    this.height,
    this.width,
    this.iconHeight,
    this.iconWidth,
    this.iconColor,
    this.style,
    this.textPadding = EdgeInsets.zero,
    this.textStyle
  });

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
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            getSvg(
              type: 'icons',
              name: iconName,
              height: iconHeight,
              width: iconWidth,
              color: iconColor,
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
      ),
    );
  }
}
