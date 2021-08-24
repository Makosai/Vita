import 'package:flutter/material.dart';
import 'package:vita/widget/buttons/sidebar_flat_button_tab.dart';
import 'package:vita/widget/buttons/sidebar_flat_button.dart';

class _SidebarState extends State<Sidebar> {
  int index = 0;

  int getIndex() {
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.sidebarWidth,
      child: Column(
        children: [
          SidebarFlatButton(
            onPressed: () {},
            iconName: 'pen-to-square',
            text: 'New Message',
          ),
          ...widget.sidebarButtonTabs
              .asMap()
              .entries
              .map((entry) {
            int i = entry.key;
            Map<String, String> element = entry.value;

            String? iconName = element["iconName"];
            String? text = element["text"];

            return SidebarButtonTab(
            iconName: iconName!,
            text: text!,
            isSelected: () => i == getIndex(),
            onPressed: () => {
              setState(() {
                index = i;
              })
            },
            );
          })
        ],
      ),
    );
  }
}

class Sidebar extends StatefulWidget {
  final double sidebarWidth = 225.0;
  final double sidebarSpacing = 10.0;

  final List<Map<String, String>> sidebarButtonTabs = [
    {
      "iconName": 'inbox',
      "text": 'Inbox',
    },
    {
      "iconName": 'file',
      "text": 'Draft',
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
  State<StatefulWidget> createState() => _SidebarState();
}
