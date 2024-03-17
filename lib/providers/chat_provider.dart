import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatProvider extends ChangeNotifier {
  // final ChatSession? chat;
  bool isNotLoading = true;

  Future<void> sendChatMessage(
      ChatSession chat,
      String? message,
      BuildContext context,
      TextEditingController textController,
      FocusNode textFieldFocus) async {
    message ??= textController.text.trim();
    if (message.isEmpty) {
      _showError('Please enter you promt!', context);
      return;
    }
    toggleLoading();

    try {
      final response = await chat.sendMessage(Content.text(message));
      final text = response.text;

      if (text == null) {
        _showError('No Response from API', context);
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      _showError(e.toString(), context);
    } finally {
      toggleLoading();
      textController.clear();
      textFieldFocus.requestFocus();
      notifyListeners();
    }
  }

  void customResponse(String message) {}

  void toggleLoading() {
    isNotLoading = !isNotLoading;
    notifyListeners();
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
