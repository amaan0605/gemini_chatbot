import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';

Container backgroundContainer(
    {Widget? child, double? padding, double? height}) {
  return Container(
    height: height,
    padding: EdgeInsets.only(top: padding ?? screenSize.height * .07),
    decoration: const BoxDecoration(
      //BACKGROUND IMAGE
      image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        fit: BoxFit.fill,
      ),
      gradient: LinearGradient(
          colors: [Colors.black12, Colors.black87, Colors.black26]),
    ),
    child: child,
  );
}
