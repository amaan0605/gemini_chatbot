import 'dart:convert';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:http/http.dart' as http;

// String _convertIntoBase64(File file) {
//   List<int> imageBytes = file.readAsBytesSync();
//   String base64File = base64Encode(imageBytes);
//   return base64File;
// }

Future<void> generateImageResponse(
    {required String promt, required String imageData}) async {
  //var base64Imge = _convertIntoBase64(image);

  final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1/models/gemini-pro-vision:GenerateContent?key=$apiKey");
  http.Response response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": promt},
              {
                "inlineData": {"mimeType": "image/png", "data": imageData}
              }
            ]
          }
        ]
      }));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data['candidates'][0]['content']['parts'][0]['text']);
  } else {
    throw Exception(
        'Failed to Generate Text: ${response.statusCode}\n${response.body}');
  }
}
