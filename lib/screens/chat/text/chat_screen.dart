import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:gemini_chatbot/screens/chat/custom_chat_ui.dart';
import 'package:gemini_chatbot/services/api/text_api.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final List<types.User> _typing = [];
  final _user = const types.User(
    id: '1',
    firstName: "User",
  );
  final _bot = const types.User(
      id: "2",
      firstName: 'Gemini Bot',
      imageUrl:
          'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png');

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      id: randomString(),
      text: message.text,
    );
    setState(() {
      _messages.insert(0, textMessage);
      _typing.add(_bot);
    });

    var response = await generatedChatResponse(message.text);

    final chatMessage = types.TextMessage(
      author: _bot,
      id: randomString(),
      text: response,
    );
    setState(() {
      _typing.remove(_bot);
      _messages.insert(0, chatMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChatScreen")),
      body: Chat(
        typingIndicatorOptions: TypingIndicatorOptions(typingUsers: _typing),
        messages: _messages,
        onSendPressed: (types.PartialText m) {
          _handleSendPressed(m);
        },
        user: _user,
        showUserAvatars: true,
        //showUserNames: true,
        inputOptions: const InputOptions(
            sendButtonVisibilityMode: SendButtonVisibilityMode.always),
        theme: customChatScreenTheme(context),
      ),
    );
  }
}
