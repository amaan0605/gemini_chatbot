import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class TravelPlanScreen extends StatefulWidget {
  const TravelPlanScreen({super.key});

  @override
  State<TravelPlanScreen> createState() => _TravelPlanScreenState();
}

class _TravelPlanScreenState extends State<TravelPlanScreen> {
  final TextEditingController _travelController = TextEditingController();
  @override
  void dispose() {
    _travelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Planner'), centerTitle: true),
      body: backgroundContainer(
          padding: 10,
          child: SingleChildScrollView(
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
                        "Pack Your Bags & Relax! BotBuddy Creates Your Ideal Itinerary",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const MyHeadingText(heading: 'D E S T I N A T I O N'),
                  CustomTextField(
                    controller: _travelController,
                    hintText: 'Please specify your destination...',
                  ),
                  const SizedBox(height: 20),
                  const MyHeadingText(heading: 'B U D G E T'),
                  CustomTextField(
                    controller: _travelController,
                    hintText: 'Enter your Budget (ex: 10000INR)',
                  ),
                  const SizedBox(height: 20),
                  const MyHeadingText(heading: 'N O   O F   P O E P L E'),
                  CustomTextField(
                    controller: _travelController,
                    hintText: 'Enter number of poeple',
                  ),
                  const SizedBox(height: 20),
                  const MyHeadingText(heading: 'I N T E R E S T'),
                  CustomTextField(
                    controller: _travelController,
                    hintText: 'Please specify your activities and interests...',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 100)
                ],
              ),
            ),
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: myFloatingActionButton(onTap: () {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
