import 'package:flutter/material.dart';
import 'package:vita/utils/helpers.dart';
import 'package:vita/widget/panels/desktop_app_bar.dart';

class AccountsNew extends StatelessWidget {
  const AccountsNew();

  Widget build(BuildContext context) {
    Widget buildDesktop() {
      return DesktopAppBar(title: 'New Account');
    }

    Widget buildMobile() {
      return buildDesktop(); // Temporary.
    }

    return isDesktop ? buildDesktop() : buildMobile();
  }
}