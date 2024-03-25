import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/common_widget.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: backgroundContainer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 40, 8, 8),
          child: Column(
            children: [
              //Get Premium
              FrostedGlassBox(
                  height: screenSize.height * .2, child: const Text('Get VIP')),
              const SizedBox(height: 20),
              //main settings
              FrostedGlassBox(
                  height: screenSize.height * .2,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SettingsTitleButton(
                          text: 'Change Username',
                          icon: Icons.person_4_outlined,
                        ),
                        const Divider(color: Colors.white24),
                        const SettingsTitleButton(
                          text: 'Change Password',
                          icon: Icons.password,
                        ),
                        const Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'Change Theme',
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
                            _launchUrl(
                                'https://www.buymeacoffee.com/botbuddyy');
                          },
                        ),
                        const Divider(color: Colors.white24),
                        const SettingsTitleButton(
                          text: 'REQUEST FEATURE',
                          icon: Icons.edit_document,
                        ),
                        const Divider(color: Colors.white24),
                        const SettingsTitleButton(
                          text: 'FEEDBACK',
                          icon: Icons.feedback,
                        ),
                        const Divider(color: Colors.white24),
                        const SettingsTitleButton(
                          text: 'SHARE',
                          icon: Icons.offline_share,
                        ),
                        const Divider(color: Colors.white24),
                        const SettingsTitleButton(
                          text: 'LOGOUT',
                          icon: Icons.logout,
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

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch');
    }
  }
}
