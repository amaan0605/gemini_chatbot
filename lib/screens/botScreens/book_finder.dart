import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class BookFinderScreen extends StatelessWidget {
  BookFinderScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Finder'),
        centerTitle: true,
      ),
      body: backgroundContainer(
          child: Column(
        children: [CustomTextField(controller: controller)],
      )),
    );
  }
}
