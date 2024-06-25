import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class ArticleWriteScreen extends StatefulWidget {
  const ArticleWriteScreen({super.key});

  @override
  State<ArticleWriteScreen> createState() => _ArticleWriteScreenState();
}

class _ArticleWriteScreenState extends State<ArticleWriteScreen> {
  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  @override
  void dispose() {
    _topicController.dispose();
    _wordController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Writer'),
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
                        "BotBuddy: Your AI Co-Writer for Articles, Blogs & More! ➕",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const MyHeadingText(heading: 'T O P I C'),
                  CustomTextField(
                    controller: _topicController,
                    hintText: 'Please specify your topic...',
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  const MyHeadingText(heading: 'W O R D   L I M I T'),
                  CustomTextField(
                    controller: _wordController,
                    hintText: 'Enter your maximum word limit...',
                    keyboardType: const TextInputType.numberWithOptions(),
                  ),
                  const SizedBox(height: 20),
                  const MyHeadingText(
                      heading: 'O T H E R  I N F O R M A T I O N'),
                  CustomTextField(
                    controller: _infoController,
                    hintText: 'Enter other information (i.e: Language)',
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: myFloatingActionButton(onTap: () async {
          Provider.of<ChatProvider>(context, listen: false).sendChatMessage(
              context,
              'Act as expert article writer. Write me detailed article based on these details. Topic: ${_topicController.text}, Word Limit: ${_wordController.text}, other info: ${_infoController.text}');
          await Navigator.pushNamed(context, '/chatscreen');
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
