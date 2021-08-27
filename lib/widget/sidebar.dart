import 'package:flutter/material.dart';
import 'package:vita/theme/models.dart';
import 'package:vita/widget/buttons/sidebar_flat_button_tab.dart';
import 'package:vita/widget/buttons/sidebar_flat_button.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  Sidebar({Key? key}) : super(key: key);

  final double sidebarWidth = 225.0;
  final double sidebarSpacing = 10.0;

  final List<Map<String, String>> sidebarButtonTabs = [
    {
      "iconName": 'inbox',
      "text": 'Inbox',
      "route": "/inbox",
    },
    {
      "iconName": 'file',
      "text": 'Draft',
      "route": "/",
    },
    {
      "iconName": 'star',
      "text": 'Starred',
    },
    {
      "iconName": 'paper-plane',
      "text": 'Sent',
    },
    {
      "iconName": 'trash',
      "text": 'Trash',
    },
    {
      "iconName": 'shield-exclamation',
      "text": 'Spam',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sidebarWidth,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SidebarFlatButton(
            onPressed: () {},
            iconName: 'pen-to-square',
            text: 'New Message',
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: sidebarButtonTabs.length,
                itemBuilder: (c, i) {
                  Map<String, String> element = sidebarButtonTabs[i];

                  String? iconName = element["iconName"];
                  String? text = element["text"];
                  String? route = element["route"];

                  return SidebarButtonTab(
                    iconName: iconName!,
                    text: text!,
                    isSelected: () {
                      return (i == context.watch<SidebarModel>().index);
                    },
                    onPressed: () {
                      context.read<SidebarModel>().setIndex(i);
                      if (route != null) {
                        Navigator.pushNamed(context, route);
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
