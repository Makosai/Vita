import 'package:flutter/material.dart';
import 'package:vita/theme/models.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/utils/helpers.dart';
import 'package:provider/provider.dart';
import 'package:vita/widget/panels/item_info.dart';

class Sidebar extends StatelessWidget {
  Sidebar({Key? key}) : super(key: key);

  final double sidebarWidth = 225.0;
  final double mobileSidebarWidth = 300.0;
  final double sidebarSpacing = 10.0;

  static final ItemInfo topElem = ItemInfo(
    itemType: ItemType.SidebarFlat,
    name: 'New Message',
    iconName: 'pen-to-square',
  );

  static final List<ItemInfo> midScroll = [
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

  static final ItemInfo botElem = ItemInfo(
    itemType: ItemType.SidebarTab,
    name: 'Settings',
    iconName: 'gear',
    route: '/settings',
  );

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return buildSidebar(context, sidebarWidth);
    }

    return buildSidebar(context, mobileSidebarWidth);
  }

  static bool isSelected(BuildContext context, int i) {
    return (i == context.read<SidebarModel>().index);
  }

  static void onPressed(BuildContext? context, int? i, String? route) {
    print("test");
    if (context != null && i != null) {
      context.read<SidebarModel>().setIndex(i);
      if (route != null) {
        Navigator.popAndPushNamed(context, route);
      }
    }
  }

  Widget buildSidebar(BuildContext context, double width) {
    print('Sidebar: ${ModalRoute.of(context)!.isCurrent}');
    final index = context.watch<SidebarModel>().index;

    return Container(
      width: width,
      height: double.maxFinite,
      color: CurrentTheme.canvas,
      child: Column(children: [
        topElem.toWidget(() {}),
        Expanded(
          child: Scrollbar(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: midScroll.length,
              itemBuilder: (c, i) {
                ItemInfo item = midScroll[i];
                return item.toWidget(() => onPressed(context, i, item.route),
                    isSelected: i == index);
              },
            ),
          ),
        ),
        botElem.toWidget(
            () => onPressed(context, midScroll.length, botElem.route),
            isSelected: midScroll.length == index)
      ]),
    );
  }
}
