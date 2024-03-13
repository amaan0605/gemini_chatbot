import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.onSubmitted,
      this.hintText,
      this.toHide});

  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final String? hintText;
  final bool? toHide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        // shadows: [
        //   BoxShadow(
        //       color: Colors.white30,
        //       offset: Offset(2, 5),
        //       blurRadius: 5,
        //       spreadRadius: 2)
        // ],
        gradient: LinearGradient(
          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.4],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      child: TextField(
          controller: controller,
          obscureText: toHide ?? false,
          // expands: false,
          style: const TextStyle(fontSize: 15.0, color: Colors.black87),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15.0),
            hintText: hintText ?? 'Enter your promt...',
            hintStyle:
                const TextStyle(color: Colors.black26, fontFamily: 'Poppins'),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade900),
              borderRadius: BorderRadius.circular(32.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
          onSubmitted: onSubmitted),
    );
  }
}
