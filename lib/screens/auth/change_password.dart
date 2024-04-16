import 'package:flutter/material.dart';
import 'package:gemini_chatbot/services/auth/auth_services.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/widgets/custom_button.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: backgroundContainer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 50, 8, 8),
          child: Column(
            children: [
              const Text(
                'Forgot your Password?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Please enter the registerd email to reset your password 🔒',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _textEditingController,
                hintText: 'Enter your email...',
              ),
              const SizedBox(height: 20),
              CustomButton(
                  onPressed: () async {
                    String? mess = await _authService
                        .resetPassword(_textEditingController.text);

                    if (mess == 'Success') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Reset password'),
                              content: const Text(
                                  'Email has been send successfully\nPlease check your email and reset your password'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'))
                              ],
                            );
                          });
                    }
                  },
                  text: 'Proceed')
            ],
          ),
        ),
      ),
    );
  }
}
