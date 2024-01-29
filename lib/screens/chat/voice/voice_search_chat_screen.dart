import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: const Text('Voice Search'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
            onTap: () {
              if (isAvailable) {
                speechToText.listen(onResult: (value) async {
                  setState(() {
                    searchText = value.recognizedWords;
                  });
                  var responseText = await generatedChatResponse(searchText!);
                  setState(() {
                    searchText = responseText.toString();
                  });
                });
              }
            },
            child: const Icon(Icons.mic)),
      ),
      //  FloatingActionButton(
      //   onPressed: () {
      //     if (isAvailable) {
      //       speechToText.listen(onResult: (value) async {
      //         setState(() {
      //           searchText = value.recognizedWords;
      //         });
      //         var responseText = await generatedChatResponse(searchText!);
      //         print(responseText.toString());
      //       });
      //     }
      //   },
      //   child: const Icon(Icons.mic),
      // ),
      body: Center(
        child: Text(searchText!),
      ),
    );
  }
}
