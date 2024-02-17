import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      this.margin,
      this.topOpacity,
      this.bottomOpacity});

  final double height;
  final double width;
  final Widget child;
  final double? margin;
  final double? topOpacity;
  final double? bottomOpacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.transparent,
          margin: EdgeInsets.all(margin ?? 0),
          height: height,
          width: width,
          child: Stack(
            children: [
              //top
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container()),
              //middle
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(topOpacity ?? .15),
                      Colors.white.withOpacity(bottomOpacity ?? 0.05)
                    ],
                  ),
                ),
              ),
              //The Child
              Center(
                child: child,
              )
            ],
          ),
        ));
  }
}
