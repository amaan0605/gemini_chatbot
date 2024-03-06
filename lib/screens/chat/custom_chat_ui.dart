import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

DarkChatTheme customChatScreenTheme(BuildContext context) {
  return DarkChatTheme(
      backgroundColor: Colors.grey.shade900,
      inputBackgroundColor: Colors.black,
      emptyChatPlaceholderTextStyle: const TextStyle(
          fontFamily: 'Overpass',
          fontWeight: FontWeight.w700,
          color: Colors.white),
      inputTextColor: Colors.white,
      primaryColor: Colors.black,
      secondaryColor: Colors.grey.shade800);
}

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
