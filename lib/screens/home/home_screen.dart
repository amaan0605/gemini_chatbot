import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/navigator_provider.dart';
import 'package:gemini_chatbot/screens/chat/image/image_search_chat_screen.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/screens/chat/voice/voice_search_chat_screen.dart';
import 'package:gemini_chatbot/screens/varients/preference_page.dart';
import 'package:gemini_chatbot/utils/widgets/bot_varients_grid.dart';
import 'package:gemini_chatbot/utils/widgets/custom_search_containers.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,

        //APPBAR
        appBar: appBar(),
        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: screenSize.height * .07),
            decoration: const BoxDecoration(
              //BACKGROUND IMAGE
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                  colors: [Colors.black12, Colors.black87, Colors.black26]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TITLE CARD
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                  child: const Text(
                    'How may I help \nyou today?',
                    style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LargeSearchContainer(
                        height: screenSize.height, width: screenSize.width),
                    Column(
                      children: [
                        SmallSearchContainer(
                          title: 'Voice\nSearch',
                          color: const Color(0xFFc09ff8),
                          svgImagePath: 'assets/images/voice_logo.svg',
                          ontap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: const VoiceSearchChatScreen(),
                                  type: PageTransitionType.rightToLeft,
                                ));
                          },
                        ),
                        SmallSearchContainer(
                          color: const Color(0xFFfec4dd),
                          svgImagePath: 'assets/images/image_logo.svg',
                          title: "Search\nby Image",
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ImageSearchChatScreen()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
                  child: Text(
                    "BotBuddy Varients",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    BotVarient(
                      color: const Color(0xFF7BD3EA),
                      title: 'Movie Recommend',
                      subtitle: 'Find best movies around you',
                      icon: Icons.movie_creation_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PreferencePage()));
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFFDFCCFB),
                      title: 'Email Writer',
                      subtitle: 'write professional Emails',
                      icon: Icons.email_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()));
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFFFFBE98),
                      title: 'Programming',
                      subtitle: 'Solve your coding doubts',
                      icon: Icons.code,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()));
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFFF0DBAF),
                      title: 'Book',
                      subtitle: 'find best books for you',
                      icon: Icons.book_outlined,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()));
                      },
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<NavigatorProvider>(context, listen: false)
                          .setIndex(1);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                            screenSize.width * 0.9, screenSize.height * 0.05),
                        backgroundColor: Colors.white),
                    child: const Text('View More',
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
