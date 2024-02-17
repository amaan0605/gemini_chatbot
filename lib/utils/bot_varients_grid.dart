import 'package:flutter/material.dart';

class BotVarient extends StatelessWidget {
  const BotVarient({
    super.key,
    this.color,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final Color? color;
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color ?? Colors.teal[400],
          borderRadius: BorderRadius.circular(20)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black26,
            child: Icon(
              icon,
            )),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Bebas',
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'Bebas',
            fontSize: 13,
            color: Colors.black54,
          ),
        )
      ]),
    );
  }
}
