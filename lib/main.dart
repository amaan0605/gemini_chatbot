import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chatbot/firebase_options.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/providers/chip_provider.dart';
import 'package:gemini_chatbot/providers/navigator_provider.dart';
import 'package:gemini_chatbot/providers/signup_provider.dart';
import 'package:gemini_chatbot/screens/auth/login_screen.dart';
import 'package:gemini_chatbot/screens/auth/signup_screen.dart';
import 'package:gemini_chatbot/screens/botScreens/article_writer.dart';
import 'package:gemini_chatbot/screens/botScreens/book_finder.dart';
import 'package:gemini_chatbot/screens/botScreens/email_writer.dart';
import 'package:gemini_chatbot/screens/botScreens/game_screen.dart';
import 'package:gemini_chatbot/screens/botScreens/movie_recommend.dart';
import 'package:gemini_chatbot/screens/botScreens/programming_solver.dart';
import 'package:gemini_chatbot/screens/botScreens/translate_screen.dart';
import 'package:gemini_chatbot/screens/botScreens/travel_plan.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
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
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => NavigatorProvider()),
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => ChipProvider()),
      ],
      child: MaterialApp(
        title: 'BotBuddy',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: const MainPage(),
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/homepage': (context) => const HomeScreen(),
          '/chatscreen': (context) => const ChatScreen(),
          '/movieScreen': (context) => const MovieRecommendScreen(),
          '/emailScreen': (context) => const EmailWriterScreen(),
          '/bookScreen': (context) => BookFinderScreen(),
          '/programmingScreen': (context) => ProgrammingSolverScreen(),
          '/gameScreen': (context) => GameScreen(),
          '/translateScreen': (context) => TranslateScreen(),
          '/articleScreen': (context) => const ArticleWriteScreen(),
          '/travelScreen': (context) => const TravelPlanScreen(),
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const BottomNavigationBarScreen();
            } else {
              return const SplashScreen();
            }
          }),
    );
  }
}
