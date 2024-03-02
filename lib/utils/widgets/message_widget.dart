import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gemini_chatbot/main.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment:
                isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              isFromUser
                  ? Container()
                  : Image.asset(
                      'assets/images/ai_logo.png',
                      height: 50,
                      width: 50,
                    ),
              const SizedBox(width: 2),
              Container(
                constraints: BoxConstraints(maxWidth: screenSize.width * .8),
                decoration: BoxDecoration(
                  color: isFromUser
                      ? Colors.grey[850]
                      : const Color.fromARGB(230, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomRight: isFromUser
                          ? const Radius.circular(0)
                          : const Radius.circular(18),
                      bottomLeft: isFromUser
                          ? const Radius.circular(18)
                          : const Radius.circular(0)),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                margin: const EdgeInsets.only(bottom: 8),
                child: MarkdownBody(
                  selectable: true,
                  data: text,
                  styleSheet: MarkdownStyleSheet(
                      a: const TextStyle(color: Colors.black, fontSize: 15),
                      p: isFromUser
                          ? const TextStyle(color: Colors.white, fontSize: 15)
                          : const TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
