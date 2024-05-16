import 'package:flutter/material.dart';

class VoiceSearchProvider extends ChangeNotifier {
  bool isGlowing = false;

  void setGlowingTrue() {
    isGlowing = true;
    notifyListeners();
  }

  void setGlowingFalse() {
    isGlowing = false;
    notifyListeners();
  }
}
