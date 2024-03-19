import 'package:flutter/material.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/screens/varients/preference_page.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
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
        child: Column(
          children: [
            const MyHeadingText(heading: 'Enter your Problem'),
            CustomTextField(
              controller: controller,
              maxLines: 5,
            ),
            const MyHeadingText(heading: 'Programming Language'),
            CustomTextField(controller: controller)
          ],
        ),
      ),
      floatingActionButton: myFloatingActionButton(onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
