import 'package:gemini_chatbot/secret/secret_key.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

Future<dynamic> generatedChatResponse(String promt) async {
  final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=$apiKey");

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
                {"text": promt},
              ]
            }
          ],
          "generationConfig": {
            "stopSequences": ["Title"],
            "temperature": 0.8,
            "maxOutputTokens": 1000,
            "topP": 1,
            "topK": 40
          }
        },
      ),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data['candidates'][0]['content']['parts'][0]['text']);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      return "";
    }
  } catch (e) {
    // print("Error is: ${e.toString()}");
  }
}

// Future<void> generateConversionalResponse(String promt, String userType) async {
//   final url = Uri.parse(
//       "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey");

//   http.Response chatResponse = await http.post(
//     url,
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(
//       {
//         // "contents": [
//         //   {
//         //     "role": "user",
//         //     "parts": [
//         //       {
//         //         "text":
//         //             "Write the first line of a story about a magic backpack."
//         //       }
//         //     ]
//         //   },
//         //   {
//         //     "role": "model",
//         //     "parts": [
//         //       {
//         //         "text":
//         //             "In the bustling city of Meadow brook, lived a young girl named Sophie. She was a bright and curious soul with an imaginative mind."
//         //       }
//         //     ]
//         //   },
//         //   {
//         //     "role": "user",
//         //     "parts": [
//         //       {"text": "Can you set it in a quiet village in 1600s France?"}
//         //     ]
//         //   },
//         // ]
//         "contents": [
//           {
//             "role": 'user', //"user",
//             "parts": [
//               {
//                 "text": promt //"hiii"
//               }
//             ]
//           },
//           {
//             "role": "model",
//             "parts": [
//               {"text": ""}
//             ]
//           }
//         ]
//       },
//     ),
//   );
//   if (chatResponse.statusCode == 200) {
//     var chatData = jsonDecode(chatResponse.body);
//     log(chatData['candidates'][0]['content']['parts'][0]['role']);
//     log(chatData['candidates'][0]['content']['parts'][0]['text']);
//   }
// }
