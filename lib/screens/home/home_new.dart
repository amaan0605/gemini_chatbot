import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/screens/chat/image/image_search_chat_screen.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/screens/chat/voice/voice_search_chat_screen.dart';
import 'package:gemini_chatbot/utils/bot_varients_grid.dart';
import 'package:gemini_chatbot/utils/frosted_glass_box.dart';
import 'package:lottie/lottie.dart';

class HomeNewScreen extends StatelessWidget {
  const HomeNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,

        //APPBAR
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "BotBuddy",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.account_circle)],
        ),

        //BODY
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              //BACKGROUND IMAGE
              image: DecorationImage(
                image:
                    // NetworkImage(
                    //     "https://assets-global.website-files.com/5a9ee6416e90d20001b20038/64d223cc9b2ceac6ec4bfdc7_%20-%2026.png"),
                    // fit: BoxFit.cover,
                    // colorFilter:
                    //     ColorFilter.mode(Colors.black45, BlendMode.darken)
                    AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                  colors: [Colors.black12, Colors.black87, Colors.black26]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TITLE CARD
                FrostedGlassBox(
                  margin: 20,
                  height: height * 0.18,
                  width: width,
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Welcome to Tomorrow\nBotBuddy in Action!",
                                style: TextStyle(
                                    fontSize: 16,
                                    //fontWeight: FontWeight.w900,
                                    fontFamily: 'IBM'),
                              ),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor:
                                        const Color.fromARGB(150, 0, 0, 0)),
                                child: const Text(
                                  'Subscribe',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                        Container(
                          child: Lottie.asset('assets/lottie/robot.json',
                              height: 150, width: 150, repeat: false),
                        )
                      ],
                    )
                  ]),
                ),

                //Search by banners
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
                  child: Text(
                    "Search by",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatScreen()
                                  //const ChatScreen()
                                  ));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: height * 0.30,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFc6f432),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 10, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.black26,
                                        radius: 25,
                                        child: SvgPicture.asset(
                                          'assets/images/chat_icon.svg',
                                          color: Colors.black,
                                          height: 30,
                                          width: 30,
                                        )),
                                    const Icon(
                                      Icons.arrow_outward_outlined,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.10),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                                child: Text("Chat\nBOTBUDDY",
                                    style: TextStyle(
                                      fontFamily: 'IBM',
                                      color: Colors.black,
                                      fontSize: 20,
                                    )),
                              ),
                            ],
                          ),
                        )),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const VoiceSearchChatScreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 120,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFc09ff8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 10, 10, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.black26,
                                          child: SvgPicture.asset(
                                            'assets/images/voice_logo.svg',
                                            color: Colors.black,
                                            height: 25,
                                            width: 25,
                                          )),
                                      const Icon(
                                        Icons.arrow_outward_outlined,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                                // SizedBox(height: height * 0.10),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                                  child: Text("Voice\nSearch",
                                      style: TextStyle(
                                          fontFamily: 'IBM',
                                          fontSize: 12,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ImageSearchChatScreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 120,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFfec4dd)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 10, 10, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.black26,
                                          child: SvgPicture.asset(
                                            'assets/images/image_logo.svg',
                                            color: Colors.black,
                                            height: 20,
                                            width: 20,
                                          )),
                                      const Icon(
                                        Icons.arrow_outward_outlined,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                                // SizedBox(height: height * 0.10),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                                  child: Text("Search\nby Image",
                                      style: TextStyle(
                                          fontFamily: 'IBM',
                                          fontSize: 12,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                          ),
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
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    BotVarient(
                      color: Colors.yellow[200],
                      title: 'Movie Recommend',
                      subtitle: 'Find best movies around you',
                      icon: Icons.movie_creation_outlined,
                    ),
                    const BotVarient(
                      color: Colors.tealAccent,
                      title: 'Email Writer',
                      subtitle: 'write professional Emails',
                      icon: Icons.email_outlined,
                    ),
                    const BotVarient(
                      color: Colors.orangeAccent,
                      title: 'Programming',
                      subtitle: 'Solve your coding doubts',
                      icon: Icons.code,
                    ),
                    const BotVarient(
                      color: Colors.greenAccent,
                      title: 'Book',
                      subtitle: 'find best books for you',
                      icon: Icons.book_outlined,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(items: const [
        //   BottomNavigationBarItem(
        //       label: 'Home',
        //       icon: Icon(
        //         Icons.home,
        //       )),
        //   BottomNavigationBarItem(
        //       label: 'Settings',
        //       icon: Icon(
        //         Icons.settings,
        //       )),
        // ]),
      ),
    );
  }
}
