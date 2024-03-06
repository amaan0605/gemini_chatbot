import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chatbot/providers/navigator_provider.dart';
import 'package:gemini_chatbot/screens/home/home_screen.dart';
import 'package:gemini_chatbot/screens/settings/setting_page.dart';
import 'package:gemini_chatbot/screens/varients/bot_varients_page.dart';
import 'package:gemini_chatbot/utils/constants.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final List _pages = [
    const HomeScreen(),
    const BotVarientsPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigatorProvider>(
      builder: (context, pValue, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: _pages.elementAt(pValue.selectedIndex),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CustomNavigationBar(
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.more_horiz_sharp),
                  title: const Text('More'),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
              ],
              currentIndex: pValue.selectedIndex,
              onTap: pValue.setIndex,
              iconSize: 24.0,
              selectedColor: kGreenColor,
              strokeColor: Colors.green,
              unSelectedColor: Colors.grey[600],
              backgroundColor: kBlackColor,
              borderRadius: const Radius.circular(20.0),
              isFloating: true,
            ),
          ),
        );
      },
    );
  }
}
