import 'package:flutter/material.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatProvider extends ChangeNotifier {
  late GenerativeModel _model;
  late ChatSession _chatInstance;
  bool isNotLoading = true;

  ChatSession get chat => _chatInstance;

  ChatProvider() {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );

    _initChat();
  }

  void _initChat() async {
    _chatInstance = _model.startChat(history: [
      Content.text(
          "You are BotBuddy, a personal AI Chatbot. Your job is to answer user's questions. You can use a fun tone and emoji"),
      Content.model([
        TextPart(
            "Nice to meet you, I'm BotBuddy! Ask me anything and I'll do my best to help!")
      ])
    ]);
    notifyListeners();
  }

  //loading
  void toggleLoading() {
    isNotLoading = !isNotLoading;
    notifyListeners();
  }

  Future<void> sendChatMessage(BuildContext context, String message) async {
    // Set loading as true
    toggleLoading();

    try {
      var response = await chat.sendMessage(Content.text(message));
      var text = response.text;
      if (text == null) {
        _showError('No response from API.', context);
      } else {}
    } catch (e) {
      _showError(e.toString(), context);
    } finally {
      toggleLoading();
    }
  }

  void _showError(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Got it!'),
            )
          ],
        );
      },
    );
  }
}
