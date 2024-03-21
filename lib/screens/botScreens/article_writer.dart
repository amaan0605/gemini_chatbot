import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class ArticleWriteScreen extends StatefulWidget {
  const ArticleWriteScreen({super.key});

  @override
  State<ArticleWriteScreen> createState() => _ArticleWriteScreenState();
}

class _ArticleWriteScreenState extends State<ArticleWriteScreen> {
  final TextEditingController _articleController = TextEditingController();
  @override
  void dispose() {
    _articleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Writer'),
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
                      "BotBuddy: Your AI Co-Writer for Articles, Blogs & More! ➕",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const MyHeadingText(heading: 'T O P I C'),
                CustomTextField(
                  controller: _articleController,
                  hintText: 'Please specify your topic...',
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                const MyHeadingText(heading: 'W O R D   L I M I T'),
                CustomTextField(
                  controller: _articleController,
                  hintText: 'Enter your maximum word limit...',
                ),
                const SizedBox(height: 20),
                const MyHeadingText(
                    heading: 'O T H E R  I N F O R M A T I O N'),
                CustomTextField(
                  controller: _articleController,
                  hintText: 'Enter other information (i.e: Language)',
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: myFloatingActionButton(onTap: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
