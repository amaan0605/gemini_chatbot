import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/home/home_screen.dart';
import 'package:gemini_chatbot/screens/navigationBar/navigation_bar.dart';
import 'package:gemini_chatbot/services/auth/auth_services.dart';
import 'package:gemini_chatbot/utils/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_button.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = true;

  @override
  void dispose() {
    _nameController;
    _emailController;
    _passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 40, 0, 0),
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios)),
                ),
                SizedBox(height: screenSize.height * .13),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FrostedGlassBox(
                    height: screenSize.height * .6,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'SignUp Screen',
                            style: TextStyle(fontSize: 40),
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            controller: _nameController,
                            hintText: 'Enter your Name',
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Enter your Email',
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _passwordController,
                            toHide: showPassword,
                            hintText: 'Enter your Password',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0, top: 4),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Text(showPassword
                                    ? 'Show Password'
                                    : 'Hide Password'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                              onPressed: () async {
                                await AuthService()
                                    .registration(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                )
                                    .then((value) {
                                  if (value!.contains('Success')) {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            childCurrent: widget,
                                            type: PageTransitionType
                                                .bottomToTopPop,
                                            duration: const Duration(
                                                milliseconds: 600),
                                            child:
                                                const BottomNavigationBarScreen()));
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(value),
                                    ),
                                  );
                                });
                              },
                              text: 'Register Now'),
                          Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child:
                                  const Text("Already Registered? Login Now"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
