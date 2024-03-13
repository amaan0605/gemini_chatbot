import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider extends ChangeNotifier {
  String _userName = '';
  String get username => _userName;

  getUsername(String username) async {
    _userName = username;
    setUserName();
    notifyListeners();
  }

  setUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username.toString());
    notifyListeners();
  }
}
