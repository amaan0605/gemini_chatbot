import 'package:flutter/material.dart';
import 'package:gemini_chatbot/secret/secret_key.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/widgets/bot_varients_grid.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BotVarientsPage extends StatefulWidget {
  const BotVarientsPage({super.key});

  @override
  State<BotVarientsPage> createState() => _BotVarientsPageState();
}

class _BotVarientsPageState extends State<BotVarientsPage> {
  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: backgroundContainer(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    BotVarient(
                      color: const Color(0xFF7BD3EA),
                      title: 'Movie Recommend',
                      subtitle: 'Find Your Perfect Movie Match',
                      icon: Icons.movie_creation_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, '/movieScreen');
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFFDFCCFB),
                      title: 'Email Writer',
                      subtitle: 'Write It Right, Write It Fast',
                      icon: Icons.email_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, '/emailScreen');
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFF8E7AB5),
                      title: 'Travel Plan',
                      subtitle: 'Your AI Travel Planner',
                      icon: Icons.travel_explore,
                      onTap: () =>
                          Navigator.pushNamed(context, '/travelScreen'),
                    ),
                    BotVarient(
                      color: const Color(0xFFEEA5A6),
                      title: 'Programming',
                      subtitle: 'Solve your coding doubts',
                      icon: Icons.code,
                      onTap: () {
                        Navigator.pushNamed(context, '/programmingScreen');
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFFF0DBAF),
                      title: 'Book',
                      subtitle: 'Find books for you',
                      icon: Icons.book_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, '/bookScreen');
                      },
                    ),
                    // _bannerAd == null
                    //     // Nothing to render yet.
                    //     ? const CircularProgressIndicator()
                    //     // The actual ad.
                    //     : AdWidget(ad: _bannerAd!),
                    BotVarient(
                      color: const Color(0xFFC3E2C2),
                      title: 'Play Games',
                      subtitle: 'Play Games with BotBuddy!',
                      icon: Icons.gamepad,
                      onTap: () => Navigator.pushNamed(context, '/gameScreen'),
                    ),
                    BotVarient(
                      color: const Color(0xFFD2E0FB),
                      title: 'Translate',
                      subtitle: 'Translate Anything, Anywhere',
                      icon: Icons.translate,
                      onTap: () =>
                          Navigator.pushNamed(context, '/translateScreen'),
                    ),
                    BotVarient(
                      color: const Color(0xFFDEBA9D),
                      title: 'Aritcle Writer',
                      subtitle: 'Write Faster & Smarter',
                      icon: Icons.article_outlined,
                      onTap: () =>
                          Navigator.pushNamed(context, '/articleScreen'),
                    ),
                  ],
                ),
              ),
            ),
            // _bannerAd == null
            //     // Nothing to render yet.
            //     ? const CircularProgressIndicator()
            //     // The actual ad.
            //     : SizedBox(
            //         height: 60,
            //         width: double.infinity,
            //         child: AdWidget(ad: _bannerAd!)),
          ],
        ),
      ),
    );
  }

  /// Loads a banner ad.
  void _loadAd() {
    final bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }
}
