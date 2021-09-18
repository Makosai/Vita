import 'package:flutter/material.dart';
import 'package:vita/routes/scaffold_wrap.dart';
import 'package:vita/routes/settings/accounts.dart';
import 'package:vita/theme/models.dart';
import 'package:provider/provider.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/utils/helpers.dart';
import 'package:vita/widget/vertical_panel.dart';

class SettingsPage extends StatelessWidget {
  final settingsTabs = [
    ItemInfo(name: 'Accounts', iconName: 'star', route: 'accounts')
  ];

  final subroutes = {"accounts": AccountsPage()};

  @override
  Widget build(BuildContext context) {
    print('TestWidget: ${ModalRoute.of(context)!.isCurrent}');

    List<Widget> children = [
      VerticalPanel(
        width: isDesktop ? Sizing.verticalPanelWidth : Sizing.verticalPanelWidthMobile,
        height: MediaQuery.of(context).size.height,
        topScroll: settingsTabs,
        color: CurrentTheme.content,
        isSelected: (BuildContext context, int i) {
          return (i == context.watch<AccountsModel>().index);
        },
        onPressed: (BuildContext? context, int? i, String? route) {
          if (context != null && i != null) {
            context.read<AccountsModel>().setIndex(i);
            if (route != null) {
              if(subroutes.containsKey(route)) {
                context.read<AccountsModel>().setView(subroutes[route]!);
              }
            }
          }
        },
      )
    ];

    if (context.watch<AccountsModel>().view != null) {
      children.add(context.read<AccountsModel>().view!);
    }

    return ScaffoldWrap(
      content: Row(
        children: children,
      ),
    );
  }
}
