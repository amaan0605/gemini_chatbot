import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class BookFinderScreen extends StatelessWidget {
  BookFinderScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Finder'),
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
                      "Can't Decide? Let BotBuddy Be Your Book Genie!🧐🧞‍♂️",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const MyHeadingText(heading: 'Book Type'),
                CustomTextField(
                  controller: controller,
                  hintText: 'Enter book type (i.e: Novel, Comics)',
                ),
                const SizedBox(height: 10),
                const MyHeadingText(heading: 'Location'),
                CustomTextField(
                  controller: controller,
                  hintText: 'Enter book location',
                ),
                const SizedBox(height: 10),
                const MyHeadingText(heading: 'Other Informantion'),
                CustomTextField(
                  controller: controller,
                  hintText: 'Enter other information about book',
                  maxLines: 3,
                ),
              ],
            ),
          )),
      floatingActionButton: myFloatingActionButton(onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
