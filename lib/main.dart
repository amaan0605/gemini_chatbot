import 'package:flutter/material.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/screens/home/home_new.dart';
import 'package:gemini_chatbot/screens/home/home_screen.dart';
import 'package:gemini_chatbot/screens/splash/splash_screen.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:gemini_chatbot/theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BotBuddy',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const HomeNewScreen(),
    );
  }
}
