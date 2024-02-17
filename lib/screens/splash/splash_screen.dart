import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome to",
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text("FUTURE",
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(50),
              child: Column(
                children: [
                  CustomButton(onPressed: () {}, text: "Signin using email"),
                  const SizedBox(height: 20),
                  CustomButton(onPressed: () {}, text: "Signin as a Guest"),
                ],
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: const Text("New User? Register Now"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
