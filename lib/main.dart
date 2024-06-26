import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chatbot/firebase_options.dart';
import 'package:gemini_chatbot/providers/admob_provider.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/providers/chip_provider.dart';
import 'package:gemini_chatbot/providers/navigator_provider.dart';
import 'package:gemini_chatbot/providers/signup_provider.dart';
import 'package:gemini_chatbot/providers/voice_search_provider.dart';
import 'package:gemini_chatbot/screens/auth/login_screen.dart';
import 'package:gemini_chatbot/screens/auth/signup_screen.dart';
import 'package:gemini_chatbot/screens/bot_screens/article_writer.dart';
import 'package:gemini_chatbot/screens/bot_screens/book_finder.dart';
import 'package:gemini_chatbot/screens/bot_screens/email_writer.dart';
import 'package:gemini_chatbot/screens/bot_screens/game_screen.dart';
import 'package:gemini_chatbot/screens/bot_screens/movie_recommend.dart';
import 'package:gemini_chatbot/screens/bot_screens/programming_solver.dart';
import 'package:gemini_chatbot/screens/bot_screens/translate_screen.dart';
import 'package:gemini_chatbot/screens/bot_screens/travel_plan.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
// import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/screens/home/home_screen.dart';
import 'package:gemini_chatbot/screens/navigationBar/navigation_bar.dart';
import 'package:gemini_chatbot/screens/settings/setting_page.dart';
import 'package:gemini_chatbot/screens/splash/splash_screen.dart';
// import 'package:gemini_chatbot/screens/home/home_screen.dart';
// import 'package:gemini_chatbot/screens/splash/splash_screen.dart';
// import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:gemini_chatbot/theme/dark_theme.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

late Size screenSize;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MobileAds.instance.initialize();
  //unawaited(MobileAds.instance.initialize());

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
        ChangeNotifierProvider(create: (context) => AdmobProvider()),
        ChangeNotifierProvider(create: (context) => VoiceSearchProvider())
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
          '/bookScreen': (context) => const BookFinderScreen(),
          '/programmingScreen': (context) => const ProgrammingSolverScreen(),
          '/gameScreen': (context) => const GameScreen(),
          '/translateScreen': (context) => const TranslateScreen(),
          '/articleScreen': (context) => const ArticleWriteScreen(),
          '/travelScreen': (context) => const TravelPlanScreen(),
          '/settingsPage': (context) => const SettingsPage(),
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
