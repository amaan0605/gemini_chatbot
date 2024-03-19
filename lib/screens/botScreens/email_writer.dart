import 'package:flutter/material.dart';
import 'package:gemini_chatbot/screens/navigationBar/my_fab.dart';
import 'package:gemini_chatbot/screens/varients/preference_page.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';

class EmailWriterScreen extends StatelessWidget {
  EmailWriterScreen({super.key});

  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Writer📝'),
        centerTitle: true,
      ),
      body: backgroundContainer(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyHeadingText(heading: 'Subject'),
            CustomTextField(controller: _subjectController),
            const MyHeadingText(heading: 'Name of Reciepent'),
            CustomTextField(controller: _nameController),
            const MyHeadingText(heading: 'Date'),
            CustomTextField(controller: _dateController),
            const MyHeadingText(
              heading: 'other info',
            ),
            CustomTextField(controller: _infoController, maxLines: 2),
          ],
        ),
      )),
      floatingActionButton: myFloatingActionButton(onTap: () {}),
      // FloatingActionButton.extended(
      //   onPressed: () async {
      //     //   Provider.of<ChatProvider>(context, listen: false).sendChatMessage(
      //     //       context,
      //     //       'You are a film master and all the movies. Now please recommend me some best movies: Type: ${genreList.lastOrNull}, Region: ${counryList.lastOrNull}, Actor: ${_actorController.text}, Other info: ${_infoController.text}');
      //     //   await Navigator.pushNamed(context, '/chatscreen');
      //   },
      //   isExtended: true,
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   icon: const Icon(Icons.search_rounded),
      //   label: const Text("Let's gooooooooo"),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
