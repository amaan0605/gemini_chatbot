import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/services/api/text_api.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceSearchChatScreen extends StatefulWidget {
  const VoiceSearchChatScreen({super.key});

  @override
  State<VoiceSearchChatScreen> createState() => _VoiceSearchChatScreenState();
}

class _VoiceSearchChatScreenState extends State<VoiceSearchChatScreen> {
  String? searchText = 'Press button to search';
  SpeechToText speechToText = SpeechToText();
  bool isAvailable = false;
  bool isListening = false;
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    isAvailable = await SpeechToText().initialize();
    setState(() {});
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
          child: GestureDetector(
            onTapUp: (_) {
              setState(() {
                isListening = true;
              });
              if (isAvailable) {
                speechToText.listen(onResult: (value) async {
                  setState(() {
                    searchText = value.recognizedWords;
                    isListening = false;
                  });
                  var responseText = await generatedChatResponse(searchText!);
                  setState(() {
                    searchText = responseText.toString();
                  });
                });
              }
            },
            onDoubleTapDown: (_) {
              setState(() {
                isListening = false;
              });
            },
            child: isListening
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
