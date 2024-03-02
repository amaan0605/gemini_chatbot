import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  bool _loading = true;

  bool get loading => _loading;

  void setTrue() {
    _loading = false;
    notifyListeners();
  }

  void setFalse() {
    _loading = true;

    notifyListeners();
  }
}
