import 'package:gemini_chatbot/secret/secret_key.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

Future<dynamic> generatedChatResponse(String promt) async {
  final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=$apiKey");

  try {
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "contents": [
            {
              "parts": [
                {"text": "Write a story about a magic backpack"},
              ]
            }
          ]
        },
      ),
    );
    var data = jsonDecode(response.body);
    return data['candidates'][0]['content']['parts'][0]['text'];
  } catch (e) {
    // print("Error is: ${e.toString()}");
  }
}
