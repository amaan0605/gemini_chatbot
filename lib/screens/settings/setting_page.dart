import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/common_widget.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: Container(
        padding: EdgeInsets.only(top: screenSize.height * .12),
        decoration: const BoxDecoration(
          //BACKGROUND IMAGE
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
              colors: [Colors.black12, Colors.black87, Colors.black26]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingsTitleButton(
                          text: 'Privacy Policy',
                          icon: Icons.privacy_tip_outlined,
                        ),
                        Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'Term of Services',
                          icon: Icons.edit_document,
                        ),
                        Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'Feedback',
                          icon: Icons.feedback,
                        ),
                        Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'Share',
                          icon: Icons.offline_share,
                        ),
                        Divider(color: Colors.white24),
                        SettingsTitleButton(
                          text: 'Logout',
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
}
