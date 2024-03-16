import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/chip_provider.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/utils/common/frosted_glass_box.dart';
import 'package:gemini_chatbot/utils/common/my_chips.dart';
import 'package:gemini_chatbot/utils/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({super.key});

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
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
    //print(Provider.of<ChipProvider>(context).selectedList);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Recommend'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            //BACKGROUND IMAGE
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
                colors: [Colors.black12, Colors.black87, Colors.black26]),
          ),
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
                const PrefHeadingText(
                  heading: 'G E N R E',
                ),
                const Divider(),
                MyCustomChips(
                  list: movieType,
                ),
                const SizedBox(height: 30),
                const PrefHeadingText(heading: 'C O U N T R Y'),
                const Divider(),
                MyCustomChips(
                  list: movieCountry,
                ),
                const SizedBox(height: 30),
                const PrefHeadingText(heading: 'A C T O R'),
                const Divider(),
                CustomTextField(
                  controller: _actorController,
                  hintText: 'Enter any Actor name',
                ),
                const SizedBox(height: 30),
                const PrefHeadingText(heading: 'O T H E R   I N F O'),
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
          onPressed: () {
            final selectedList = value.selectedList;
            // final selectedList =
            //     Provider.of<ChipProvider>(context, listen: false).selectedList;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChatScreen(
                        // modelPromt:
                        //     'You are a film master and all the movies. Now please recommend me some best movies: Type: ${selectedList[0]}, Region: ${selectedList[1]}, Actor: ${_actorController.text}, Other info: ${_infoController.text}'),
                        )));
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

//Custom Heading Text
class PrefHeadingText extends StatelessWidget {
  const PrefHeadingText({
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
