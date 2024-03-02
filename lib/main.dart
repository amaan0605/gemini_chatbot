import 'package:flutter/material.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
// import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/screens/home/home_screen.dart';
import 'package:gemini_chatbot/screens/navigationBar/navigation_bar.dart';
import 'package:gemini_chatbot/screens/splash/splash_screen.dart';
// import 'package:gemini_chatbot/screens/home/home_screen.dart';
// import 'package:gemini_chatbot/screens/splash/splash_screen.dart';
// import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:gemini_chatbot/theme/dark_theme.dart';
import 'package:provider/provider.dart';

late Size screenSize;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'BotBuddy',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: const BottomNavigationBarScreen(),
      ),
    );
  }
}
