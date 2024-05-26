import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/auth/change_password.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/common_widget.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      drawer: drawer(context),
      body: backgroundContainer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 40, 8, 8),
          child: Column(
            children: [
              //Get Premium
              // FrostedGlassBox(
              //     height: screenSize.height * .2, child: const Text('Get VIP')),
              const SizedBox(height: 20),
              //main settings
              FrostedGlassBox(
                  height: screenSize.height * .15,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SettingsTitleButton(
                        //   text: 'Change Username',
                        //   icon: Icons.person_4_outlined,
                        // ),
                        // const Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'CHANGE PASSWORD',
                          icon: Icons.password,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangePasswordScreen())),
                        ),
                        const Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'CHANGE THEME',
                          icon: Icons.precision_manufacturing_outlined,
                          onTap: () {
                            showMyDialog(
                                context: context,
                                title: 'New Themes Alert!',
                                message:
                                    'Coming soon! Fresh themes are on the way. Share your ideas and shape the future look of your app. Stay tuned! 🎨');
                          },
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              //Other Settings
              FrostedGlassBox(
                  height: screenSize.height * .3,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingsTitleButton(
                          text: 'BUY ME A COFFEE',
                          icon: Icons.coffee,
                          onTap: () {
                            launchURL('https://www.buymeacoffee.com/botbuddyy');
                          },
                        ),
                        const Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'REQUEST FEATURE',
                          icon: Icons.edit_document,
                          onTap: () => launchURL(
                              'https://docs.google.com/forms/d/e/1FAIpQLScypVjjkfzNBbclcoRIVA61a1vhCnKigV6FD-5-zxVSb1jjkw/viewform?usp=sf_link'),
                        ),
                        const Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'FEEDBACK',
                          icon: Icons.feedback,
                          onTap: () => launchURL(
                              'https://docs.google.com/forms/d/e/1FAIpQLSfOH35fxlCLoJYkM9sxWhe4jdNdMvfzQ-RhzGdMsTWQ8dhbTA/viewform?usp=sf_link'),
                        ),
                        const Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'SHARE',
                          icon: Icons.offline_share,
                          onTap: () async {
                            await Share.share(
                                'Check out our other apps: https://play.google.com/store/apps/developer?id=THE+ETHIX+INC.',
                                subject: 'BotBuddy: Advance AI Chatbot');
                          },
                        ),
                        const Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'LOGOUT',
                          icon: Icons.logout,
                          onTap: () => FirebaseAuth.instance.signOut(),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> launchURL(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView)) {
    throw Exception('Could not launch');
  }
}
