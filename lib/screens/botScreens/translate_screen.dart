import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate Page'),
      ),
      body: backgroundContainer(
        padding: 10,
        child: Column(
          children: [
            FrostedGlassBox(
              height: screenSize.height * .2,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Who's the Champ? Play Games & See Who Reigns Supreme with BotBuddy!👾🎮",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const MyHeadingText(heading: 'heading')
          ],
        ),
      ),
    );
  }
}
