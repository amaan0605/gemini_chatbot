import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceSearchChatScreen extends StatefulWidget {
  const VoiceSearchChatScreen({super.key});

  @override
  State<VoiceSearchChatScreen> createState() => _VoiceSearchChatScreenState();
}

class _VoiceSearchChatScreenState extends State<VoiceSearchChatScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Press the button and start speaking";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            // Send _text to your chatbot API
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
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
            onTap: () async {
              await _listen();
              //Navigate to chat screen
              if (!_isListening) {
                Provider.of<ChatProvider>(context, listen: false)
                    .sendChatMessage(context, _text);
                await Future.delayed(const Duration(milliseconds: 500));
                await Navigator.pushNamed(context, '/chatscreen');
              }
            },
            child: _isListening
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 100, 8, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FrostedGlassBox(
                  height: screenSize.height * 0.5,
                  child: Text(
                    _text.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
