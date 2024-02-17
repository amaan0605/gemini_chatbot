import 'package:flutter/material.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/screens/chat/image/image_search_chat_screen.dart';
import 'package:gemini_chatbot/screens/chat/voice/voice_search_chat_screen.dart';
import 'package:gemini_chatbot/utils/frosted_glass_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
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
                        Image.asset(
                          'assets/images/robo.png',
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
                        child: FrostedGlassBox(
                          margin: 10,
                          height: height * 0.30,
                          width: width * 0.45,
                          // topOpacity: .10,
                          // bottomOpacity: 0,
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
                                    FrostedGlassBox(
                                        height: 60,
                                        width: 60,
                                        child: SvgPicture.asset(
                                          'assets/images/chat_icon.svg',
                                          color: Colors.white,
                                          height: 35,
                                          width: 35,
                                        )),
                                    const Icon(Icons.arrow_outward_outlined)
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.10),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                                child: Text("Chat\nBOTBUDDY",
                                    style: TextStyle(
                                      fontFamily: 'IBM',
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
                          child: FrostedGlassBox(
                            margin: 10,
                            height: 120,
                            width: 180,
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
                                      FrostedGlassBox(
                                          height: 40,
                                          width: 40,
                                          child: SvgPicture.asset(
                                            'assets/images/voice_logo.svg',
                                            color: Colors.white,
                                            height: 25,
                                            width: 25,
                                          )),
                                      const Icon(Icons.arrow_outward_outlined)
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
                                      )),
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
                          child: FrostedGlassBox(
                            margin: 10,
                            height: 120,
                            width: 180,
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
                                      FrostedGlassBox(
                                          height: 40,
                                          width: 40,
                                          child: SvgPicture.asset(
                                            'assets/images/image_logo.svg',
                                            color: Colors.white,
                                            height: 25,
                                            width: 25,
                                          )),
                                      const Icon(Icons.arrow_outward_outlined)
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
                                      )),
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
                    "Popular Prompts",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FrostedGlassBox(
                        margin: 10,
                        height: 250,
                        width: 170,
                        child: Text("Text")),
                    FrostedGlassBox(
                        margin: 10,
                        height: 250,
                        width: 170,
                        child: Text("Text")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
