import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class ProgrammingSolverScreen extends StatefulWidget {
  const ProgrammingSolverScreen({super.key});

  @override
  State<ProgrammingSolverScreen> createState() =>
      _ProgrammingSolverScreenState();
}

class _ProgrammingSolverScreenState extends State<ProgrammingSolverScreen> {
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();

  @override
  void dispose() {
    _problemController.dispose();
    _languageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coding Expert'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: backgroundContainer(
          height: screenSize.height,
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const MyHeadingText(
                    heading: 'E N T E R   Y O U R   P R O B L E M'),
                CustomTextField(
                  controller: _problemController,
                  maxLines: 5,
                  hintText: 'Enter your programming problem \nor any doubt',
                ),
                const SizedBox(height: 20),
                const MyHeadingText(heading: 'L A N G U A G E   N A M E'),
                CustomTextField(
                  controller: _languageController,
                  hintText: 'Enter programming language name...',
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: myFloatingActionButton(onTap: () async {
          Provider.of<ChatProvider>(context, listen: false).sendChatMessage(
              context,
              'Act as programming expert. Please solve my problem/doubts using these details: problem/doubt: ${_problemController.text}, programming language: ${_languageController.text}');
          await Navigator.pushNamed(context, '/chatscreen');
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
