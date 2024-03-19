import 'package:flutter/material.dart';

const Color kGreenColor = Color(0xFFc6f432);
const Color kBlackColor = Color(0xFF060706);

//Custom Heading Text
class MyHeadingText extends StatelessWidget {
  const MyHeadingText({
    super.key,
    required this.heading,
  });
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }
}
