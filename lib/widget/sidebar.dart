import 'package:flutter/material.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';

import 'button_icon.dart';

class Sidebar extends StatelessWidget {
  final double sidebarWidth = 216.0;
  final double sidebarSpacing = 10.0;
  final ButtonStyle flatButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(CurrentTheme.btnNeutral),
    foregroundColor: MaterialStateProperty.all<Color>(CurrentTheme.textPrimary),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(
      Sizing.padding1,
      Sizing.padding2,
      Sizing.padding1,
      Sizing.padding2,
    )),
  );
  final ButtonStyle flatTabStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(CurrentTheme.canvas),
    foregroundColor:
        MaterialStateProperty.all<Color>(CurrentTheme.textSecondary),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(
      Sizing.padding4,
      Sizing.padding2,
      Sizing.padding1,
      Sizing.padding4,
    )),
  );
  final TextStyle activeWeight = TextStyle(fontWeight: FontWeight.w800);
  final TextStyle inactiveWeight = TextStyle(fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sidebarWidth,
      child: Container(
        color: CurrentTheme.canvas,
        child: Padding(
          padding: EdgeInsets.all(Sizing.padding5),
          child: Column(children: <Widget>[
            ButtonIcon(
              onPressed: () {},
              iconName: 'pen-to-square',
              text: 'New Message',
              iconHeight: Sizing.icon1,
              iconColor: CurrentTheme.textPrimary,
              style: flatButtonStyle,
              textPadding: EdgeInsets.fromLTRB(Sizing.padding4, 0, 0, 0),
              textStyle: activeWeight,
            ),
            SizedBox(height: sidebarSpacing),
            ButtonIcon(
              onPressed: () {},
              iconName: 'inbox',
              text: 'Inbox',
              iconHeight: Sizing.icon1,
              iconColor: CurrentTheme.textSecondary,
              style: flatTabStyle,
              textPadding: EdgeInsets.fromLTRB(Sizing.padding4, 0, 0, 0),
              textStyle: inactiveWeight,
            ),
            ButtonIcon(
              onPressed: () {},
              iconName: 'file',
              text: 'Draft',
              iconHeight: Sizing.icon1,
              iconColor: CurrentTheme.textSecondary,
              style: flatTabStyle,
              textPadding: EdgeInsets.fromLTRB(Sizing.padding4, 0, 0, 0),
              textStyle: inactiveWeight,
            ),
            ButtonIcon(
              onPressed: () {},
              iconName: 'star',
              text: 'Starred',
              iconHeight: Sizing.icon1,
              iconColor: CurrentTheme.textSecondary,
              style: flatTabStyle,
              textPadding: EdgeInsets.fromLTRB(Sizing.padding4, 0, 0, 0),
              textStyle: inactiveWeight,
            ),
          ]),
        ),
      ),
    );
  }
}
