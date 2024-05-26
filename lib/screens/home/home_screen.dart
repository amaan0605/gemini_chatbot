import 'package:flutter/material.dart';
import 'package:gemini_chatbot/main.dart';
import 'package:gemini_chatbot/providers/admob_provider.dart';
import 'package:gemini_chatbot/providers/navigator_provider.dart';
import 'package:gemini_chatbot/screens/botScreens/book_finder.dart';
import 'package:gemini_chatbot/screens/botScreens/email_writer.dart';
import 'package:gemini_chatbot/screens/botScreens/programming_solver.dart';
import 'package:gemini_chatbot/screens/chat/image/image_search_chat_screen.dart';
import 'package:gemini_chatbot/screens/botScreens/movie_recommend.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:gemini_chatbot/services/ads/ad_helper.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/widgets/bot_varients_grid.dart';
import 'package:gemini_chatbot/utils/widgets/common_widget.dart';
import 'package:gemini_chatbot/utils/widgets/custom_search_containers.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdHelper adHelper = AdHelper();
  @override
  void initState() {
    super.initState();
    adHelper.loadInterstitialAd(imageInterstitialId);
  }

  @override
  void dispose() {
    adHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    BannerAd homeBannerAd = AdHelper.loadBannerAd(bannerIdUnit);

    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          Provider.of<AdmobProvider>(context, listen: false).loadCloseAd();
          bool canPop = await _onWillPop(context);
          if (canPop) {
            Navigator.pop(context);
          } else {
            return;
          }
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: appBar(context),
          drawer: drawer(context),
          body: SingleChildScrollView(
            child: backgroundContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TITLE CARD
                  Container(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, bottom: 20),
                    child: const Text(
                      'How may I help \nyou today?',
                      style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LargeSearchContainer(
                        height: screenSize.height,
                        width: screenSize.width,
                        onTap: () {
                          adHelper.showInterstitialAd();
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const ChatScreen(),
                                  type: PageTransitionType.rightToLeft));
                        },
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              const SmallSearchContainer(
                                title: 'Voice\nSearch',
                                color: Color(0xFFc09ff8),
                                svgImagePath: 'assets/images/voice_logo.svg',
                                // ontap: () {

                                // Navigator.push(
                                //     context,
                                //     PageTransition(
                                //       child: const VoiceSearchChatScreen(),
                                //       type: PageTransitionType.rightToLeft,
                                //     ));
                                //},
                              ),
                              InkWell(
                                onTap: () => showMyDialog(
                                    context: context,
                                    title: 'Coming Soon🎙️',
                                    message:
                                        "🗣️ Ready to chat hands-free? Our Voice Search feature is on its way! Soon, you can just talk to BotBuddy to find answers and get help. Stay tuned for the fun! 🎉"),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 120,
                                  width: screenSize.width * .4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black26),
                                  child: const Center(
                                    child:
                                        CircleAvatar(child: Icon(Icons.lock)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SmallSearchContainer(
                            color: const Color(0xFFfec4dd),
                            svgImagePath: 'assets/images/image_logo.svg',
                            title: "Search\nby Image",
                            ontap: () {
                              adHelper.showInterstitialAd();
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
                    primary: false,
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
                                  builder: (context) =>
                                      const MovieRecommendScreen()));
                        },
                      ),
                      BotVarient(
                        color: const Color(0xFFDFCCFB),
                        title: 'Email Writer',
                        subtitle: 'Write professional Emails',
                        icon: Icons.email_outlined,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EmailWriterScreen()));
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
                                  builder: (context) =>
                                      const ProgrammingSolverScreen()));
                        },
                      ),
                      BotVarient(
                        color: const Color(0xFFF0DBAF),
                        title: 'Book',
                        subtitle: 'Find best books for you',
                        icon: Icons.book_outlined,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BookFinderScreen()));
                        },
                      ),
                    ],
                  ),
                  //ADMOB AD BANNER
                  SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: AdWidget(ad: homeBannerAd)),
                  //Bottom Button
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
      ),
    );
  }
}

Future<bool> _onWillPop(BuildContext context) async {
  return await showDialog(
        context: context,
        barrierDismissible: false, // Prevent dismiss on tap outside
        builder: (context) => AlertDialog(
          title: const Text("Exit"),
          content: const Text("Do you want to exit?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pop(true), // Return true to pop the route
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pop(false), // Return false to stay on the route
              child: const Text(
                "No",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ) ??
      false; // Handle null case by returning false (stay on the route)
}
