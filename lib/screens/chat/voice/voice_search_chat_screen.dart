import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gemini_chatbot/screens/chat/custom_chat_ui.dart';
import 'package:gemini_chatbot/services/api/text_api.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:lottie/lottie.dart';

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
  // final List<types.Message> _messages = [];
  // final List<types.User> _typing = [];
  // final _user = const types.User(
  //   id: '1',
  //   firstName: "User",
  // );
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
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
            child: isListening
                ? Lottie.asset(
                    'assets/lottie/voice.json',
                    width: 200,
                    height: 200,
                  )
                : const CircleAvatar(
                    backgroundColor: Colors.black, //Colors.grey.shade900,
                    radius: 40,
                    child: Icon(
                      Icons.mic,
                      color: Color(0xFFC5FFAC),
                      size: 30,
                    ),
                  ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "How can i help you?",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        )
        //  Chat(
        //   messages: _messages,
        //   onSendPressed: (m) {},
        //   user: _user,
        //   theme: customChatScreenTheme(context),
        // ),
        );
  }
}


// import 'package:flutter/material.dart';
// import 'package:gemini_chatbot/models/chat_model.dart';
// import 'package:gemini_chatbot/secret/secret_key.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // final url = Uri.parse(
// //     "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey");
// // const apiEndpoint =
// //     'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

// class GenerateChat extends StatefulWidget {
//   const GenerateChat({super.key});

//   @override
//   _GenerateChatState createState() => _GenerateChatState();
// }

// class _GenerateChatState extends State<GenerateChat> {
//   final TextEditingController _messageController = TextEditingController();
//   // List<Map<String, dynamic>>
//   List chatMessages = [];

//   void sendMessage(String message) async {
//     setState(() {
//       chatMessages.add({
//         "role": "user",
//         // "text": message,
//         "parts": [
//           {"text": message}
//         ],
//       });
//     });

//     var apiUrl =
//         "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey";

//     var requestBody = {
//       "contents": [
//         {
//           "role": "user",
//           "parts": [
//             {"text": message}
//           ],
//         }
//       ]
//     };

//     var response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(requestBody),
//     );

//     var responseBody = jsonDecode(response.body);
//     print(chatMessages);
//     print(responseBody);

//     setState(() {
//       chatMessages.add({
//         "role": "model",
//         "parts": [
//           {"text": responseBody["candidates"][0]['content']['parts'][0]['text']}
//         ],
//         //"text": responseBody["candidates"][0]['content']['parts'][0]['text']
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ChatBot App"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: chatMessages.length,
//               itemBuilder: (context, index) {
//                 var message = chatMessages[index];
//                 return ListTile(
//                   title: Text(
//                     message["text"],
//                     style: TextStyle(
//                       fontWeight: message["role"] == "user"
//                           ? FontWeight.normal
//                           : FontWeight.bold,
//                     ),
//                   ),
//                   tileColor: message["role"] == "user"
//                       ? Colors.blue[100]
//                       : Colors.orange[200],
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       hintText: "Type a message...",
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: () {
//                     if (_messageController.text.isNotEmpty) {
//                       sendMessage(_messageController.text);
//                       _messageController.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
