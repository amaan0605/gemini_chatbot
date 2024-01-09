import 'package:flutter/material.dart';
import 'package:gemini_chatbot/screens/chat/chat_screen.dart';
import 'package:gemini_chatbot/screens/home/home_screen.dart';
import 'package:gemini_chatbot/screens/splash/splash_screen.dart';
import 'package:gemini_chatbot/theme/dark_theme.dart';
import 'package:gemini_chatbot/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Chatbot',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
