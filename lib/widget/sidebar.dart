import 'package:flutter/material.dart';
import 'package:vita/theme/models.dart';
import 'package:vita/theme/sizing.dart';
import 'package:vita/theme/themes.dart';
import 'package:vita/utils/helpers.dart';
import 'package:provider/provider.dart';
import 'package:vita/widget/panels/item_info.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  static const double sidebarSpacing = 10.0;

  //region Elems
  static const ItemInfo topElem = const ItemInfo(
    itemType: ItemType.SidebarFlat,
    name: 'New Message',
    iconName: 'pen-to-square',
  );

  static const List<ItemInfo> midScroll = [
    const ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Inbox',
      iconName: 'inbox',
      route: '/inbox',
    ),
    const ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Draft',
      iconName: 'file',
      route: '/',
    ),
    const ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Starred',
      iconName: 'star',
      route: null,
    ),
    const ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Sent',
      iconName: 'paper-plane',
      route: null,
    ),
    const ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Trash',
      iconName: 'trash',
      route: null,
    ),
    const ItemInfo(
      itemType: ItemType.SidebarTab,
      name: 'Spam',
      iconName: 'shield-exclamation',
      route: null,
    ),
  ];

  static const ItemInfo botElem = const ItemInfo(
    itemType: ItemType.SidebarTab,
    name: 'Settings',
    iconName: 'gear',
    route: '/settings',
  );
  //endregion

  @override
  Widget build(BuildContext context) {
    void onPressed(BuildContext? context, int? i, String? route) {
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
        child: Column(
          children: [
            topElem.toWidget(() {}),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: midScroll.length,
                  itemBuilder: (c, i) {
                    ItemInfo item = midScroll[i];
                    return item.toWidget(
                          () => onPressed(context, i, item.route),
                      isSelected: i == index,
                    );
                  },
                ),
              ),
            ),
            botElem.toWidget(
                  () => onPressed(context, midScroll.length, botElem.route),
              isSelected: midScroll.length == index,
            ),
          ],
        ),
      );
    }

    if (isDesktop) {
      return buildSidebar(context, Sizing.verticalPanelWidth);
    }

    return buildSidebar(context, Sizing.verticalPanelWidthMobile);
  }
}
