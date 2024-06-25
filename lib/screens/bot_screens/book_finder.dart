import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class BookFinderScreen extends StatefulWidget {
  const BookFinderScreen({super.key});

  @override
  State<BookFinderScreen> createState() => _BookFinderScreenState();
}

class _BookFinderScreenState extends State<BookFinderScreen> {
  final TextEditingController _bookController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();

  @override
  void dispose() {
    _bookController.dispose();
    _locationController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Finder'),
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
                        "Can't Decide? Let BotBuddy Be Your Book Genie!🧐🧞‍♂️",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const MyHeadingText(heading: 'B O O K   T Y P E'),
                  CustomTextField(
                    controller: _bookController,
                    hintText: 'Enter book type (i.e: Novel, Comics)',
                  ),
                  const SizedBox(height: 10),
                  const MyHeadingText(heading: 'L O C A T I O N'),
                  CustomTextField(
                    controller: _locationController,
                    hintText: 'Enter book location',
                  ),
                  const SizedBox(height: 10),
                  const MyHeadingText(heading: 'O T H E R   I N F O'),
                  CustomTextField(
                    controller: _infoController,
                    hintText: 'Enter other information about book',
                    maxLines: 3,
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
              'Act as book expert. Suggest me top 5 books based on these info. book type: ${_bookController.text},location: ${_locationController.text}, other info: ${_infoController.text}');
          await Navigator.pushNamed(context, '/chatscreen');
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
