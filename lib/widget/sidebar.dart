import 'package:flutter/material.dart';
import 'package:vita/theme/models.dart';
import 'package:vita/utils/helpers.dart';
import 'package:provider/provider.dart';
import 'package:vita/widget/vertical_panel.dart';

class Sidebar extends StatelessWidget {
  Sidebar({Key? key}) : super(key: key);

  final double sidebarWidth = 225.0;
  final double mobileSidebarWidth = 300.0;
  final double sidebarSpacing = 10.0;

  static void Function(BuildContext? context, int? i, String? route) onPressed =
      (BuildContext? context, int? i, String? route) {
    if (context != null && i != null) {
      context.read<SidebarModel>().setIndex(i);
      if (route != null) {
        Navigator.pushNamed(context, route);
      }
    }
  };

  final ItemInfo topElem = ItemInfo(
    itemType: ItemType.SidebarFlat,
    name: 'New Message',
    iconName: 'pen-to-square',
    onPressed: (BuildContext? context, int? i, String? route) {},
  );

  final List<ItemInfo> midScroll = [
    ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Inbox',
      iconName: 'inbox',
      route: '/inbox',
    ),
    ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Draft',
      iconName: 'file',
      route: '/',
    ),
    ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Starred',
      iconName: 'star',
      route: null,
    ),
    ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Sent',
      iconName: 'paper-plane',
      route: null,
    ),
    ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Trash',
      iconName: 'trash',
      route: null,
    ),
    ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Spam',
      iconName: 'shield-exclamation',
      route: null,
    ),
  ];

  final ItemInfo botElem = ItemInfo(
    itemType: ItemType.SidebarTab,
    name: 'Settings',
    iconName: 'gear',
    route: '/settings',
  );

  @override
  Widget build(BuildContext context) {
    if (isDesktop()) {
      return buildSidebar(context, null);
    }

    return buildSidebar(context, mobileSidebarWidth);
  }

  Widget buildSidebar(BuildContext context, double? width) {
    final index = context.watch<SidebarModel>().index;

    final void Function(int) setIndex = context.read<SidebarModel>().setIndex;

    return VerticalPanel(
      width: width ?? sidebarWidth,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      topElem: topElem,
      midScroll: midScroll,
      botElem: botElem,
      isSelected: (BuildContext context, int i) {
        return (i == index);
      },
      onPressed: (BuildContext? context, int? i, String? route) {
        if (context != null && i != null) {
          setIndex(i);
          if (route != null) {
            Navigator.pushNamed(context, route);
          }
        }
      },
    );
  }
}
