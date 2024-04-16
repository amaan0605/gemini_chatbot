import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupProvider extends ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  addData(String username, String email) async {
    users.add({
      'name': username,
      'email': email,
    });
    notifyListeners();
  }

  // setUserName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', username.toString());
  //   notifyListeners();
  // }
}
