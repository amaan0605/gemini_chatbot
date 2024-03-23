import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({super.key, required this.dropdownItems, this.onChanged});

  final List<DropdownMenuItem<String>> dropdownItems;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        style: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        iconEnabledColor: Colors.black,
        decoration: InputDecoration(
            hintText: 'Choose your language',
            hintStyle:
                const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kGreenColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: kGreenColor),
        dropdownColor: kGreenColor,
        items: dropdownItems,
        onChanged: onChanged);
  }
}
