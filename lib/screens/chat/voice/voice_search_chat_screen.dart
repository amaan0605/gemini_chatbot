import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/services/api/text_api.dart';
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
  SpeechToText speechToText = SpeechToText();
  bool isAvailable = false;
  bool isGlowing = false;
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    isAvailable = await SpeechToText().initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    print("StartListing");
    setState(() {
      isGlowing = true;
    });
    print("AfterGLow");
    await speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await speechToText.stop();
    isGlowing = false;
    print("Stopppppppp");
    setState(() {});
    Provider.of<ChatProvider>(context, listen: false)
        .sendChatMessage(context, searchText)
        .then((value) => Navigator.pushNamed(context, '/chatscreen'));
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    print("Resulllltttttt\n\n\n");
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
          child: GestureDetector(
            onTap: () {
              // if (isAvailable) {
              //   print(speechToText.isNotListening);
              speechToText.isNotListening ? _startListening : _stopListening;
              //}
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
