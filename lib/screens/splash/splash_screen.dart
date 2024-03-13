import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/auth/login_screen.dart';
import 'package:gemini_chatbot/screens/auth/signup_screen.dart';
import 'package:gemini_chatbot/utils/widgets/custom_button.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              //color: Colors.red,
              height: 320,
              width: 320,
              child: Image.asset("assets/images/ai_logo.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome to",
                    style: Theme.of(context).textTheme.headlineSmall),
                Text("FUTURE",
                    style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(50),
              child: Column(
                children: [
                  CustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                childCurrent: this,
                                type: PageTransitionType.rightToLeftJoined,
                                child: const LoginScreen()));
                      },
                      text: "Log into Future"),
                  const SizedBox(height: 20),
                  CustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                childCurrent: this,
                                type: PageTransitionType.rightToLeftJoined,
                                child: const SignUpScreen()));
                      },
                      text: "New User? Join the Future"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
