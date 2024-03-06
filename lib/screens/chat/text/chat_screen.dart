import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:gemini_chatbot/utils/widgets/message_widget.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  //final bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );
    _chat = _model.startChat(history: [
      Content.text(
          "You are BotBuddy, a personal AI Chatbot. Your job is to answer user's questions. You can use a fun tone"),
      Content.model([
        TextPart(
            "Nice to meet you, I'm BotBuddy! Ask me anything and I'll do my best to help!")
      ])
    ]);
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat Screen',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        toolbarHeight: screenSize.height * .08,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, idx) {
                var content = _chat.history.toList()[idx];
                var text = content.parts
                    .whereType<TextPart>()
                    .map<String>((e) => e.text)
                    .join('');
                return MessageWidget(
                  text: text,
                  isFromUser: content.role == 'user',
                );
              },
              itemCount: _chat.history.length,
            )),
            //Provider
            Consumer<ChatProvider>(
              builder: (context, providerValue, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _textController,
                          onSubmitted: (String value) {
                            _sendChatMessage(value);
                          },
                        ),
                      ),
                      const SizedBox.square(
                        dimension: 15,
                      ),
                      if (providerValue.loading)
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade800,
                          radius: 23,
                          child: IconButton(
                            onPressed: () async {
                              _sendChatMessage(_textController.text);
                            },
                            icon: SvgPicture.asset(
                              'assets/images/send.svg',
                              color: Colors.white,
                            ),
                          ),
                        )
                      else
                        const CircularProgressIndicator(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    ChatProvider chatProvider =
        Provider.of<ChatProvider>(context, listen: false);
    //set loading as true
    chatProvider.setTrue();

    try {
      var response = await _chat.sendMessage(
        Content.text(message),
      );
      var text = response.text;

      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        chatProvider.setFalse();
        _scrollDown();
      }
    } catch (e) {
      _showError(e.toString());
      chatProvider.setFalse();
    } finally {
      _textController.clear();
      chatProvider.setFalse();
      setState(() {});
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
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
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
