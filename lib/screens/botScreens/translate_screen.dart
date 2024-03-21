import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class TranslateScreen extends StatelessWidget {
  TranslateScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Auto Detect", child: Text('Auto Detect')),
      const DropdownMenuItem(value: "English", child: Text('English')),
      const DropdownMenuItem(value: "Hindi", child: Text('Hindi')),
      const DropdownMenuItem(value: "Spanish", child: Text('Spanish')),
      const DropdownMenuItem(value: "Arabic", child: Text('Arabic')),
      const DropdownMenuItem(value: "Japanese", child: Text('Japanese')),
      const DropdownMenuItem(value: "Chinese", child: Text('Chinese')),
      const DropdownMenuItem(value: "French", child: Text('French')),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate Page'),
      ),
      body: backgroundContainer(
        padding: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FrostedGlassBox(
                height: screenSize.height * .2,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Lost in Translation? BotBuddy Saves the Day!㙟➡️️",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const MyHeadingText(heading: 'T R A N S L A T E   F R O M'),
              MyDropDown(dropdownItems: dropdownItems),
              const SizedBox(height: 30),
              const MyHeadingText(heading: 'T R A N S L A T E   T O'),
              MyDropDown(dropdownItems: dropdownItems),
              const SizedBox(height: 30),
              const MyHeadingText(heading: 'E N T E R   T E X T'),
              CustomTextField(
                controller: _controller,
                hintText: 'Enter your text...',
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: myFloatingActionButton(onTap: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MyDropDown extends StatelessWidget {
  const MyDropDown({
    super.key,
    required this.dropdownItems,
  });

  final List<DropdownMenuItem<String>> dropdownItems;

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
        onChanged: (onChanged) {});
  }
}
