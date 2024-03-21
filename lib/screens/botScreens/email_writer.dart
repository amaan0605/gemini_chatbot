import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class EmailWriterScreen extends StatefulWidget {
  const EmailWriterScreen({super.key});

  @override
  State<EmailWriterScreen> createState() => _EmailWriterScreenState();
}

class _EmailWriterScreenState extends State<EmailWriterScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _nameController.dispose();
    _dateController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Email Writer📝'),
        centerTitle: true,
      ),
      body: backgroundContainer(
          padding: screenSize.height * .01,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FrostedGlassBox(
                  height: screenSize.height * .2,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Write It Right, Write It Fast: BotBuddy's Email Generator ✍️📧",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const MyHeadingText(heading: 'Subject'),
                CustomTextField(
                  controller: _subjectController,
                  hintText: 'Enter your subject',
                ),
                const SizedBox(height: 10),
                const MyHeadingText(
                  heading: 'Name of Recipient',
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Enter your Recipient name',
                ),
                const SizedBox(height: 10),
                const MyHeadingText(heading: 'Date'),
                CustomTextField(
                  controller: _dateController,
                  hintText: 'Enter preferred date',
                ),
                const SizedBox(height: 10),
                const MyHeadingText(
                  heading: 'other info',
                ),
                CustomTextField(
                  controller: _infoController,
                  maxLines: 2,
                  hintText: 'Enter any other information',
                ),
              ],
            ),
          )),
      floatingActionButton: myFloatingActionButton(onTap: () async {
        Provider.of<ChatProvider>(context, listen: false).sendChatMessage(
            context,
            'Act as email expert. Please write me professional email using these details: Subject: ${_subjectController.text}, Recipient name: ${_nameController.text}, Date: ${_dateController.text}, Other info: ${_infoController.text}');
        await Navigator.pushNamed(context, '/chatscreen');
      }),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
