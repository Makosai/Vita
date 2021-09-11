import 'package:flutter/material.dart';
import 'package:vita/routes/settings/accounts.dart';
import 'package:vita/theme/models.dart';
import 'package:vita/widget/buttons/regular_flat_button_tab.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  final settingsTabs = {
    "iconName": "star",
    "text": "Accounts",
    "subroute": "accounts",
  };

  final subroutes = {"accounts": AccountsPage()};

  Widget buildSettingsList(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: settingsTabs.length,
        itemBuilder: (c, i) {
          Map<String, String> element = settingsTabs;

          String iconName = element["iconName"]!;
          String text = element["text"]!;
          String? subroute = element["subroute"];

          return FlatButtonTab(
            iconName: iconName,
            text: text,
            isSelected: () {
              return (i == context.watch<SidebarModel>().index);
            },
            onPressed: () {
              context.read<SidebarModel>().setIndex(i);
              if (subroute != null) {
                Navigator.pushNamed(context, subroute);
              }
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildSettingsList(context)],
    );
  }
}
