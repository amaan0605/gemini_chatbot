import 'package:flutter/material.dart';

class SettingsTitleButton extends StatelessWidget {
  const SettingsTitleButton({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(children: [
        Icon(icon),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ]),
    );
  }
}
