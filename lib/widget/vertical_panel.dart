import 'package:flutter/material.dart';
import 'package:vita/theme/models.dart';
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
  final Function(int)? isSelected;
  final Function(int)? onPressed;

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
    this.topElem,
    this.midElem,
    this.botElem,
    this.topScroll,
    this.midScroll,
    this.botScroll,
  });

  final ItemInfo? topElem,
      midElem,
      botElem; // Is not used when using anyScroll variables.
  final List<ItemInfo>? topScroll, midScroll, botScroll; // overrides the elems.

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

    return Column(
      children: widgets,
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

  Widget buildSidebarTab(BuildContext context, ItemInfo item, int i) {
    return SidebarButtonTab(
      text: item.name,
      iconName: item.iconName!,
      isSelected: item.isSelected!(i),
      onPressed: item.onPressed!(i),
    );
  }

  Widget buildSidebarFlat(BuildContext context, ItemInfo item, int i) {
    return SidebarFlatButton(
      text: item.name,
      iconName: item.iconName!,
      onPressed: item.onPressed!(i),
    );
  }

  Widget buildRegularFlat(BuildContext context, ItemInfo item, int i) {
    return FlatButtonTab(
      text: item.name,
      iconName: item.iconName!,
      isSelected: item.isSelected!(i),
      onPressed: item.onPressed!(i),
    );
  }

  Widget buildTop(BuildContext context) {
    if (topScroll != null) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: topScroll!.length,
        itemBuilder: (c, i) {
          return buildItemInfo(context, topScroll![i], i);
        },
      );
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
      return ListView.builder(
        shrinkWrap: true,
        itemCount: midScroll!.length,
        itemBuilder: (c, i) {
          return buildItemInfo(context, midScroll![i], i + offset);
        },
      );
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
      return ListView.builder(
        shrinkWrap: true,
        itemCount: botScroll!.length,
        itemBuilder: (c, i) {
          return buildItemInfo(context, botScroll![i], i + offset);
        },
      );
    }

    return buildItemInfo(context, botElem!, offset);
  }
}
