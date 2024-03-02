import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: screenSize.height * .1,
    title: const Text("BotBuddy",
        style: TextStyle(fontFamily: 'Poppins', fontSize: 24)),
    centerTitle: true,
    leading: const Icon(Icons.menu),
    actions: const [Icon(Icons.account_circle)],
  );
}
