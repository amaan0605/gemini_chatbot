import 'package:flutter/material.dart';
import 'package:gemini_chatbot/services/api/api.dart';
import 'package:gemini_chatbot/utils/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    generatedChatResponse("hello");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("ChatScreen")),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 15,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: const Icon(Icons.computer),
                    title: Text("hello ${i + 1}"),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              onTap: () {
                //print(_textEditingController.text);
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                  hintText: "Enter your Promt",
                  suffixIcon: Icon(
                    Icons.send,
                    color: kGreenColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          )
        ]),
      ),
    );
  }
}
