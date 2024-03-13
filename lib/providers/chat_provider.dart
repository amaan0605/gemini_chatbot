import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  bool _notLoading = true;

  bool get notLoading => _notLoading;

  void setTrue() {
    _notLoading = false;
    notifyListeners();
  }

  void setFalse() {
    _notLoading = true;

    notifyListeners();
  }
}
