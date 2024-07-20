import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/common/my_chips.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _infoController = TextEditingController();

  @override
  void dispose() {
    _infoController.dispose();
    super.dispose();
  }

  List myGameList = [
    'Trivia',
    'Word Games',
    'Role-Playing',
    'Interactive Storytelling',
    'Creative Writing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Game with me'),
      ),
      body: SingleChildScrollView(
        child: backgroundContainer(
            height: screenSize.height,
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
                        "Who's the Champ? Play Games & See Who Reigns Supreme with BotBuddy!👾🎮",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const MyHeadingText(heading: 'G A M E    T Y P E'),
                  const Divider(),
                  MyCustomChips(
                    list: myGameList,
                    chipName: 'game',
                  ),
                  const SizedBox(height: 30),
                  const MyHeadingText(heading: 'A N Y   O T H E R'),
                  CustomTextField(
                    controller: _infoController,
                    hintText: 'Type of game you want to play...',
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: myFloatingActionButton(onTap: () async {
          Provider.of<ChatProvider>(context, listen: false).sendChatMessage(
              context,
              'Play game with me. this is my game type: Type: ${myGameList.lastOrNull}, other info: ${_infoController.text}');
          await Navigator.pushNamed(context, '/chatscreen');
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
