import 'dart:developer';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/providers/voice_search_provider.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceSearchChatScreen extends StatefulWidget {
  const VoiceSearchChatScreen({super.key});

  @override
  State<VoiceSearchChatScreen> createState() => _VoiceSearchChatScreenState();
}

class _VoiceSearchChatScreenState extends State<VoiceSearchChatScreen> {
  String searchText = 'Press button to search';
  SpeechToText _speechToText = SpeechToText();
  bool isAvailable = false;
  bool isGlowing = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    isAvailable = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    isGlowing = true;
    setState(() {});
    log('startlisting');
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    log("Stopppppppp");
    await _speechToText.stop();
    isGlowing = false;
    setState(() {});

    //Navigate to chat screen
    Provider.of<ChatProvider>(context, listen: false)
        .sendChatMessage(context, searchText)
        .then((value) => Navigator.pushNamed(context, '/chatscreen'));
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    log("Resulllltttttt\n\n\n");
    setState(() {
      searchText = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text('Voice Search'),
          centerTitle: true,
          toolbarHeight: screenSize.height * .08,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: screenSize.height * .09),
          child: InkWell(
            onTap: () {
              _speechToText.isNotListening
                  ? _startListening()
                  : _stopListening();
            },
            child: isGlowing
                ? AvatarGlow(
                    child: CircleAvatar(
                        backgroundColor: Colors.black38,
                        radius: 40,
                        child: SvgPicture.asset(
                          'assets/images/mic_icon.svg',
                          color: Colors.white,
                          height: 40,
                          width: 40,
                        )),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 40,
                    child: SvgPicture.asset(
                      'assets/images/mic_icon.svg',
                      color: Colors.white,
                      height: 40,
                      width: 40,
                    )),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "How can i help you?",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ));
  }
}
