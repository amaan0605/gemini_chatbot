import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:gemini_chatbot/utils/widgets/message_widget.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, this.modelPromt, this.modelReply});

  final String? modelPromt;
  final String? modelReply;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) => _scrollDown());

    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat Screen',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        toolbarHeight: screenSize.height * .08,
      ),
      body: Consumer<ChatProvider>(builder: (context, chatValue, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, idx) {
                  if (idx == 0) {
                    return const SizedBox.shrink();
                  }
                  var content = chatValue.chat.history.toList()[idx];
                  var text = content.parts
                      .whereType<TextPart>()
                      .map<String>((e) => e.text)
                      .join('');
                  return MessageWidget(
                    text: text,
                    isFromUser: content.role == 'user',
                  );
                },
                itemCount: chatValue.chat.history.length,
              )),
              Provider.of<ChatProvider>(context).isNotLoading
                  ? Container()
                  : Row(
                      children: [
                        Lottie.asset('assets/lottie/Animation .json',
                            height: 70, width: 70),
                        const Text('BotBuddy is typing...')
                      ],
                    ),
              Padding(
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
                          //_sendChatMessage(value);
                        },
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 15,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      radius: 23,
                      child: IconButton(
                        onPressed: () async {
                          chatValue
                              .sendChatMessage(context, _textController.text)
                              .whenComplete(() {
                            _scrollDown();
                            _textController.clear();
                            _textFieldFocus.requestFocus();
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/images/send.svg',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
