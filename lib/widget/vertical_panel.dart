import 'package:flutter/material.dart';
import 'package:vita/widget/buttons/regular_flat_button_tab.dart';
import 'package:vita/widget/buttons/sidebar_flat_button.dart';
import 'package:vita/widget/buttons/sidebar_flat_button_tab.dart';

enum ItemType {
  SidebarTab,
  SidebarFlat,
  RegularFlat,
}

class ItemInfo {
  final ItemType itemType;
  final String name;
  final String? iconName;
  final String? route;
  final bool Function(BuildContext, int)? isSelected;
  final void Function(BuildContext?, int?, String? route)? onPressed;

  ItemInfo({
    this.itemType = ItemType.RegularFlat,
    this.name = "",
    this.iconName,
    this.route,
    this.isSelected,
    this.onPressed,
  });
}

class VerticalPanel extends StatelessWidget {
  VerticalPanel({
    this.width,
    this.height,
    this.color = Colors.white,
    this.topElem,
    this.midElem,
    this.botElem,
    this.topScroll,
    this.midScroll,
    this.botScroll,
    this.isSelected,
    this.onPressed,
  });

  final double? width, height;
  final Color color;
  final ItemInfo? topElem,
      midElem,
      botElem; // Is not used when using anyScroll variables.
  final List<ItemInfo>? topScroll, midScroll, botScroll; // overrides the elems.
  final bool Function(BuildContext, int)? isSelected;
  final void Function(BuildContext?, int?, String? route)? onPressed;

  Widget build(BuildContext context) {
    return buildAll(context);
  }

  Widget buildAll(BuildContext context) {
    List<Widget> widgets = <Widget>[];

    if (topElem != null || topScroll != null) {
      widgets.add(buildTop(context));
    }

    if (midElem != null || midScroll != null) {
      widgets.add(buildMid(context));
    }

    if (botElem != null || botScroll != null) {
      widgets.add(buildBot(context));
    }

    return Container(
      width: width,
      height: height,
      color: color,
      child: Column(
        children: widgets,
      ),
    );
  }

  Widget buildItemInfo(BuildContext context, ItemInfo item, int i) {
    switch (item.itemType) {
      case ItemType.SidebarTab:
        return buildSidebarTab(context, item, i);

      case ItemType.SidebarFlat:
        return buildSidebarFlat(context, item, i);

      case ItemType.RegularFlat:
        return buildRegularFlat(context, item, i);
    }
  }

  bool Function() getSelectedFunc(BuildContext context, ItemInfo item, int i) {
    if (item.isSelected != null) {
      return () => item.isSelected!(context, i);
    }

    if (isSelected != null) {
      return () => isSelected!(context, i);
    }

    return () => false;
  }

  void Function() getPressedFunc(BuildContext context, ItemInfo item, int i) {
    if (item.onPressed != null) {
      return () => item.onPressed!(context, i, item.route);
    }

    if (onPressed != null) {
      return () => onPressed!(context, i, item.route);
    }

    return () => {};
  }

  Widget buildSidebarTab(BuildContext context, ItemInfo item, int i) {
    return SidebarButtonTab(
      text: item.name,
      iconName: item.iconName!,
      isSelected: getSelectedFunc(context, item, i),
      onPressed: getPressedFunc(context, item, i),
    );
  }

  Widget buildSidebarFlat(BuildContext context, ItemInfo item, int i) {
    return SidebarFlatButton(
      text: item.name,
      iconName: item.iconName!,
      onPressed: getPressedFunc(context, item, i),
    );
  }

  Widget buildRegularFlat(BuildContext context, ItemInfo item, int i) {
    return FlatButtonTab(
      text: item.name,
      iconName: item.iconName!,
      isSelected: getSelectedFunc(context, item, i),
      onPressed: getPressedFunc(context, item, i),
    );
  }

  Widget buildListItems(
      BuildContext context, List<ItemInfo> listItems, int offset) {
    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listItems.length,
          itemBuilder: (c, i) {
            return buildItemInfo(context, listItems[i], i + offset);
          },
        ),
      ),
    );
  }

  Widget buildTop(BuildContext context) {
    if (topScroll != null) {
      return buildListItems(context, topScroll!, 0);
    }

    return buildItemInfo(context, topElem!, 0);
  }

  Widget buildMid(BuildContext context) {
    int offset = 0;

    if (topScroll != null) {
      offset = topScroll!.length;
    } else if (topElem != null) {
      offset = 1;
    }

    if (midScroll != null) {
      return buildListItems(context, midScroll!, offset);
    }

    return buildItemInfo(context, midElem!, offset);
  }

  Widget buildBot(BuildContext context) {
    int offset = 0;

    if (topScroll != null) {
      offset = topScroll!.length;
    } else if (topElem != null) {
      offset = 1;
    }

    if (midScroll != null) {
      offset += midScroll!.length;
    } else if (midElem != null) {
      offset += 1;
    }

    if (botScroll != null) {
      return buildListItems(context, botScroll!, offset);
    }

    return buildItemInfo(context, botElem!, offset);
  }
}
