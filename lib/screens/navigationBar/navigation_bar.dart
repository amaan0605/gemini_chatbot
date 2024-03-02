import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chatbot/screens/home/home_screen.dart';
import 'package:gemini_chatbot/screens/settings/setting_page.dart';
import 'package:gemini_chatbot/screens/varients/bot_varients_page.dart';
import 'package:gemini_chatbot/utils/constants.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const BotVarientsPage(),
    const SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: _pages.elementAt(_selectedIndex),
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          iconSize: 24.0,
          selectedColor: kGreenColor,
          strokeColor: const Color(0x300c18fb),
          unSelectedColor: Colors.grey[600],
          backgroundColor: kBlackColor,
          borderRadius: const Radius.circular(20.0),
          isFloating: true,
          scaleCurve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
    );
  }
}
