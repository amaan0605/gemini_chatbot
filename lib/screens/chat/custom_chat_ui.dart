import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gemini_chatbot/utils/constants.dart';

DarkChatTheme customChatScreenTheme(BuildContext context) {
  return DarkChatTheme(
      emptyChatPlaceholderTextStyle: TextStyle(
          fontFamily: 'Overpass',
          fontWeight: FontWeight.w700,
          color: kGreenColor),
      sentMessageBodyTextStyle:
          const TextStyle(fontFamily: 'Overpass', fontWeight: FontWeight.w700),
      receivedMessageBodyTextStyle:
          const TextStyle(fontFamily: 'IBM', fontWeight: FontWeight.w600),
      inputTextColor: kGreenColor,
      inputTextStyle:
          Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16));
}

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
