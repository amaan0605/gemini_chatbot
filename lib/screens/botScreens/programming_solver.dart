import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class ProgrammingSolverScreen extends StatelessWidget {
  ProgrammingSolverScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coding Expert'),
        centerTitle: true,
      ),
      body: backgroundContainer(
        padding: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FrostedGlassBox(
                height: screenSize.height * .2,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Don't Let Bugs Bite! \nBotBuddy Saves the Day \n🧑🏻‍💻🤖",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const MyHeadingText(heading: 'Enter your Problem'),
              CustomTextField(
                controller: controller,
                maxLines: 5,
                hintText: 'Enter your programming problem \nor any doubt',
              ),
              const SizedBox(height: 20),
              const MyHeadingText(heading: 'Programming Language'),
              CustomTextField(
                controller: controller,
                hintText: 'Enter any language',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: myFloatingActionButton(onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
