import 'package:flutter/material.dart';

class SidebarModel with ChangeNotifier {
  int _index = -1;

  int get index => _index;

  void setIndex(int newIndex) {
    _index = newIndex;

    notifyListeners();
  }
}