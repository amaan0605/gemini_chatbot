import 'package:flutter/material.dart';

class NavigatorProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
