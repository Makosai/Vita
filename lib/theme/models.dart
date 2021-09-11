import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SidebarModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = -1;

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

class AccountModel with ChangeNotifier {

}