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

  const ItemInfo({
    this.itemType = ItemType.RegularFlat,
    this.name = "",
    this.iconName,
    this.route,
  });

  Widget toWidget(void Function() onPressed, {bool? isSelected}) {
    switch (itemType) {
      case ItemType.SidebarTab:
        return SidebarButtonTab(
          text: name,
          iconName: iconName ?? '',
          isSelected: isSelected ?? false,
          onPressed: onPressed,
        );

      case ItemType.SidebarFlat:
        return SidebarFlatButton(
          text: name,
          iconName: iconName!,
          onPressed: onPressed,
        );

      case ItemType.RegularFlat:
        return FlatButtonTab(
          text: name,
          iconName: iconName!,
          isSelected: isSelected!,
          onPressed: onPressed,
        );
    }
  }
}
