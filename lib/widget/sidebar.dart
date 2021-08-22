import 'package:flutter/material.dart';
import 'package:vita/widget/buttons/sidebar_flat_button_tab.dart';
import 'package:vita/widget/buttons/sidebar_flat_button.dart';

class Sidebar extends StatelessWidget {
  final double sidebarWidth = 225.0;
  final double sidebarSpacing = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sidebarWidth,
      child: Column(
        children: [
          SidebarFlatButton(
            onPressed: () {},
            iconName: 'pen-to-square',
            text: 'New Message',
          ),
          SidebarButtonTab(
            onPressed: () {},
            iconName: 'inbox',
            text: 'Inbox',
          ),
          SidebarButtonTab(
            onPressed: () {},
            iconName: 'file',
            text: 'Draft',
          ),
          SidebarButtonTab(
            onPressed: () {},
            iconName: 'star',
            text: 'Starred',
          ),
          SidebarButtonTab(
            onPressed: () {},
            iconName: 'paper-plane',
            text: 'Sent',
          ),
          SidebarButtonTab(
            onPressed: () {},
            iconName: 'trash',
            text: 'Trash',
          ),
          SidebarButtonTab(
            onPressed: () {},
            iconName: 'shield-exclamation',
            text: 'Spam',
          )
        ],
      ),
    );
  }
}
