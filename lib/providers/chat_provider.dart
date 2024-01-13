import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

class ChatProvider extends ChangeNotifier {
  final List<User> _typing = [];
  final List<Message> _message = [];

  void setTyping(List<User> typing) {
    // _typing.add(typing);
    notifyListeners();
  }
}
