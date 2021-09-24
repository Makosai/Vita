import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita/routes/scaffold_wrap.dart';
import 'package:vita/routes/settings/accounts/accounts.dart';
import 'package:vita/theme/models.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/utils/helpers.dart';
import 'package:vita/widget/vertical_panel.dart';

class SettingsPage extends StatelessWidget {
  final settingsTabs = [
    ItemInfo(
      name: 'Accounts',
      iconName: 'user',
      route: 'accounts',
    )
  ];

  final subroutes = {"accounts": AccountsPage()};

  @override
  Widget build(BuildContext context) {
    print('TestWidget: ${ModalRoute.of(context)!.isCurrent}');
    final Widget? view = context.watch<AccountsModel>().view;

    List<Widget> children = [
      VerticalPanel(
        width: isDesktop
            ? Sizing.verticalPanelWidth
            : Sizing.verticalPanelWidthMobile,
        height: MediaQuery.of(context).size.height,
        topScroll: settingsTabs,
        color: CurrentTheme.canvasSecondary,
        isSelected: (BuildContext context, int i) {
          return (i == context.watch<AccountsModel>().index);
        },
        onPressed: (BuildContext? context, int? i, String? route) {
          if (context != null && i != null) {
            context.read<AccountsModel>().setIndex(i);
            if (route != null) {
              if (subroutes.containsKey(route)) {
                context.read<AccountsModel>().setView(subroutes[route]!);
              }
            }
          }
        },
      )
    ];

    if (view != null) {
      children.add(Expanded(child: view));
    }

    return ScaffoldWrap(
      content: Expanded(
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
