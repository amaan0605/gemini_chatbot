import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/constants.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: kGreenColor,
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontFamily: "Overpass", fontWeight: FontWeight.w700, fontSize: 20)),
  // brightness: Brightness.dark,
  useMaterial3: true,
  textTheme: TextTheme(
    headlineLarge: TextStyle(
        fontFamily: "Overpass",
        fontWeight: FontWeight.w700,
        fontSize: 65,
        color: kGreenColor),
    headlineSmall: const TextStyle(
        fontFamily: "Overpass", fontWeight: FontWeight.w700, fontSize: 20),
    headlineMedium: const TextStyle(
        fontFamily: "Overpass", fontWeight: FontWeight.w700, fontSize: 20),
  ),
  colorScheme: ColorScheme.dark(background: Colors.black, primary: kGreenColor),
);
