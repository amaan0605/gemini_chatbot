import 'package:flutter/material.dart';

class ChipProvider extends ChangeNotifier {
  final List<String> _selectedList = [];
  bool isSelected = false;

  List<String> get selectedList => _selectedList;
  // bool get isSelected => _isSelected;

  addItem(String item) {
    selectedList.add(item);
    notifyListeners();
  }

  toggleSelection() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
