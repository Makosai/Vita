import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SidebarModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = 6; // Set to Sidebar for now.

  int get index => _index;

  void setIndex(int newIndex) {
    _index = newIndex;

    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('index', index));
  }
}

class AccountsModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = -1;
  Widget? _view;

  int get index => _index;
  Widget? get view => _view;



  void setIndex(int newIndex) {
    _index = newIndex;

    notifyListeners();
  }

  void setView(Widget widget) {
    _view = widget;

    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('index', index));
  }
}