import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chip_provider.dart';
import 'package:gemini_chatbot/providers/chat_provider.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/common/constants.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/common/my_chips.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class MovieRecommendScreen extends StatefulWidget {
  const MovieRecommendScreen({super.key});

  @override
  State<MovieRecommendScreen> createState() => _MovieRecommendScreenState();
}

class _MovieRecommendScreenState extends State<MovieRecommendScreen> {
  final TextEditingController _actorController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  List<String> movieCountry = [
    "India",
    "United States",
    "China",
    "Japan",
    "South Korea",
    "United Kingdom",
    "France",
    "Germany",
    "Nigeria",
    "Iran"
  ];

  List<String> movieType = [
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Fantasy',
    'Horror',
    'Mystery',
    'Romance',
    'Science fiction',
    'Thriller',
    'Western',
    'Crime'
  ];
  @override
  void dispose() {
    _actorController;
    _infoController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Recommend'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: backgroundContainer(
          padding: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FrostedGlassBox(
                  height: screenSize.height * .2,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Let BotBuddy Recommend Movies You'll Love 🍿: \nChoose Your Genre, Country️ & Actor! 🎬✨",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const MyHeadingText(
                  heading: 'G E N R E',
                ),
                const Divider(),
                MyCustomChips(
                  list: movieType,
                  chipName: 'genre',
                ),
                const SizedBox(height: 30),
                const MyHeadingText(heading: 'C O U N T R Y'),
                const Divider(),
                MyCustomChips(
                  list: movieCountry,
                  chipName: 'country',
                ),
                const SizedBox(height: 30),
                const MyHeadingText(heading: 'A C T O R'),
                const Divider(),
                CustomTextField(
                  controller: _actorController,
                  hintText: 'Enter any Actor name',
                ),
                const SizedBox(height: 30),
                const MyHeadingText(heading: 'O T H E R   I N F O'),
                const Divider(),
                CustomTextField(
                  controller: _infoController,
                  hintText: 'Enter any other info',
                  maxLines: 2,
                ),
                SizedBox(height: screenSize.height * .1),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          Consumer<ChipProvider>(builder: (context, value, child) {
        return FloatingActionButton.extended(
          onPressed: () async {
            final genreList = value.genreList;
            final counryList = value.countryList;
            Provider.of<ChatProvider>(context, listen: false).sendChatMessage(
                context,
                'You are a film master and all the movies. Now please recommend me some best movies: Type: ${genreList.lastOrNull}, Region: ${counryList.lastOrNull}, Actor: ${_actorController.text}, Other info: ${_infoController.text}');
            await Navigator.pushNamed(context, '/chatscreen');
          },
          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          icon: const Icon(Icons.search_rounded),
          label: const Text("Let's gooooooooo"),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
