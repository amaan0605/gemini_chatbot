import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/chat/custom_chat_ui.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageSearchChatScreen extends StatefulWidget {
  const ImageSearchChatScreen({super.key});

  @override
  State<ImageSearchChatScreen> createState() => _ImageSearchChatScreenState();
}

class _ImageSearchChatScreenState extends State<ImageSearchChatScreen> {
  final List<types.Message> _mes = [];
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

  XFile? _imageFile;
//   String? _responseText;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<String?> sendApiRequest(String promt) async {
    if (_imageFile == null) return 'Please Insert a Image';

    final bytes = await _imageFile!.readAsBytes();
    final base64Image = base64Encode(bytes);

    final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro-vision:generateContent?key=$apiKey");
    http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": promt},
                {
                  "inlineData": {"mimeType": "image/png", "data": base64Image}
                }
              ]
            }
          ]
        }));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      throw Exception(
          'Failed to Generate Text: ${response.statusCode}\n${response.body}');
    }
  }

//onPressed
  void _handleImageSelection() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 1440,
    );
    setState(() {
      _imageFile = pickedImage;
    });
    final bytes = await pickedImage!.readAsBytes();
    final image = await decodeImageFromList(bytes);

    final imageMessage = types.ImageMessage(
      author: _user,
      id: randomString(),
      name: pickedImage.name,
      size: bytes.length,
      uri: pickedImage.path,
      height: image.height.toDouble(),
      width: image.width.toDouble(),
    );
    setState(() {
      _mes.insert(0, imageMessage);
    });
  }

  void _onSendPressed(types.PartialText message) async {
    final textMes = types.TextMessage(
        author: _user, id: randomString(), text: message.text);
    setState(() {
      _mes.insert(0, textMes);
      _typing.add(_bot);
    });
    var response = await sendApiRequest(textMes.text);

    final botMessage =
        types.TextMessage(author: _bot, id: randomString(), text: response!);
    setState(() {
      _typing.remove(_bot);
      _mes.insert(0, botMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Search"),
        centerTitle: true,
        toolbarHeight: screenSize.height * 0.08,
      ),
      body: Chat(
        messages: _mes,
        typingIndicatorOptions: TypingIndicatorOptions(typingUsers: _typing),
        onSendPressed: _onSendPressed,
        user: _user,
        onAttachmentPressed: _handleImageSelection,
        theme: customChatScreenTheme(context),
        showUserAvatars: true,
        //showUserNames: true,
        inputOptions: const InputOptions(
            sendButtonVisibilityMode: SendButtonVisibilityMode.always),
      ),
    );
  }
}
