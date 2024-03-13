import 'package:flutter/material.dart';
import 'package:gemini_chatbot/providers/signup_provider.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Text(Provider.of<SignupProvider>(context).username.toString()),
      ),
    );
  }
}
