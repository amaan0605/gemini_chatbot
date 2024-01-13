import 'package:flutter/material.dart';
import 'package:gemini_chatbot/screens/chat/chat_screen.dart';
import 'package:gemini_chatbot/screens/chat/image_search_chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "GEMINI PRO CHATBOT",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.account_circle)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(20)),
            child: const Center(child: Text("Banner")),
          ),
          //Search by banners
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
            child: Text(
              "Search by",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()));
                },
                child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Text"))),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("voice"))),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ImageSearchChatScreen()));
                },
                child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Image"))),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Popular Prompts",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  width: 170,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("Text"))),
              Container(
                  margin: const EdgeInsets.all(10),
                  width: 170,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("Text"))),
            ],
          )
        ],
      ),
    );
  }
}
