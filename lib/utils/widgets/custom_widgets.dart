import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/navigator_provider.dart';
import 'package:gemini_chatbot/screens/settings/setting_page.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:provider/provider.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: screenSize.height * .1,
    title: const Text("BotBuddy",
        style: TextStyle(fontFamily: 'Poppins', fontSize: 24)),
    centerTitle: true,
    leading: Builder(builder: (context) {
      return InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: const Icon(Icons.menu));
    }),
    actions: [
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/chatscreen');
            //Provider.of<NavigatorProvider>(context, listen: false).setIndex(2);
          },
          child: SvgPicture.asset(
            'assets/images/Bot.svg',
            height: 30,
            width: 30,
            color: Colors.white,
          )),
      const SizedBox(width: 10)
    ],
  );
}

drawer(BuildContext context) {
  return Drawer(
      child: ListView(
    padding: const EdgeInsets.all(0),
    children: [
      DrawerHeader(
        decoration: const BoxDecoration(
          color: kGreenColor,
        ), //BoxDecoration
        child: UserAccountsDrawerHeader(
          accountName: const Text(
            'BOTBUDDY',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          accountEmail: const Text(""),
          currentAccountPicture: SvgPicture.asset(
            'assets/images/Bot.svg',
            color: Colors.white,
            height: 35,
            width: 35,
          ),
        ),
      ),
      const SizedBox(height: 20),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('H O M E'),
        onTap: () {
          Provider.of<NavigatorProvider>(context, listen: false).setIndex(0);
        },
      ),
      ListTile(
        leading: const Icon(Icons.app_registration_rounded),
        title: const Text('V A R I E N T S '),
        onTap: () {
          Provider.of<NavigatorProvider>(context, listen: false).setIndex(1);
        },
      ),
      ListTile(
        leading: const Icon(Icons.coffee),
        title: const Text('B U Y  M E  A  C O F F E E'),
        onTap: () {
          launchURL('https://www.buymeacoffee.com/botbuddyy');
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('S E T T I N G S'),
        onTap: () {
          Provider.of<NavigatorProvider>(context, listen: false).setIndex(2);
        },
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('L O G O U T'),
        onTap: () {
          FirebaseAuth.instance.signOut();
        },
      ),
    ],
  ));
}
