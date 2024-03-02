import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
