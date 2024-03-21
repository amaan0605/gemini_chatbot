import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/common/background_image.dart';
import 'package:gemini_chatbot/utils/widgets/bot_varients_grid.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';

class BotVarientsPage extends StatelessWidget {
  const BotVarientsPage({super.key});

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
                      subtitle: 'Find best movies around you',
                      icon: Icons.movie_creation_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, '/movieScreen');
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFFDFCCFB),
                      title: 'Email Writer',
                      subtitle: 'write professional Emails',
                      icon: Icons.email_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, '/emailScreen');
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFFFFBE98),
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
                      subtitle: 'find best books for you',
                      icon: Icons.book_outlined,
                      onTap: () {
                        Navigator.pushNamed(context, '/bookScreen');
                      },
                    ),
                    BotVarient(
                      color: const Color(0xFF9BA17B),
                      title: 'Play Games',
                      subtitle: 'find best books for you',
                      icon: Icons.gamepad,
                      onTap: () => Navigator.pushNamed(context, '/gameScreen'),
                    ),
                    BotVarient(
                      color: const Color(0xFFADE4DB),
                      title: 'Translate',
                      subtitle: 'find best books for you',
                      icon: Icons.translate,
                      onTap: () =>
                          Navigator.pushNamed(context, '/translateScreen'),
                    ),
                    BotVarient(
                      color: const Color(0xFFF0DBAF),
                      title: 'Aritcle Writer',
                      subtitle: 'find best books for you',
                      icon: Icons.article_outlined,
                      onTap: () =>
                          Navigator.pushNamed(context, '/articleScreen'),
                    ),
                    BotVarient(
                      color: const Color(0xFF9BA17B),
                      title: 'Travel Plan',
                      subtitle: 'find best books for you',
                      icon: Icons.travel_explore,
                      onTap: () =>
                          Navigator.pushNamed(context, '/travelScreen'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
