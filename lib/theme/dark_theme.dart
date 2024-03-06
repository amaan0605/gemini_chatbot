import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/constants.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: kGreenColor,
  fontFamily: 'Poppins',
  // brightness: Brightness.dark,
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontFamily: "Overpass",
        fontWeight: FontWeight.w700,
        fontSize: 65,
        color: kGreenColor),
    headlineSmall: TextStyle(
        fontFamily: "Overpass", fontWeight: FontWeight.w700, fontSize: 20),
    headlineMedium: TextStyle(
        fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 20),
  ),
  colorScheme:
      const ColorScheme.dark(background: Colors.black, primary: kGreenColor),
);
