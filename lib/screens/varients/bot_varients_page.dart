import 'package:flutter/material.dart';
import 'package:gemini_chatbot/utils/widgets/bot_varients_grid.dart';
import 'package:gemini_chatbot/utils/widgets/custom_widgets.dart';

class BotVarientsPage extends StatelessWidget {
  const BotVarientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          const Text(
            'Varients',
            style: TextStyle(fontSize: 25),
          ),
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
                children: const [
                  BotVarient(
                    color: Color(0xFF7BD3EA),
                    title: 'Movie Recommend',
                    subtitle: 'Find best movies around you',
                    icon: Icons.movie_creation_outlined,
                  ),
                  BotVarient(
                    color: Color(0xFFDFCCFB),
                    title: 'Email Writer',
                    subtitle: 'write professional Emails',
                    icon: Icons.email_outlined,
                  ),
                  BotVarient(
                    color: Color(0xFFFFBE98),
                    title: 'Programming',
                    subtitle: 'Solve your coding doubts',
                    icon: Icons.code,
                  ),
                  BotVarient(
                    color: Color(0xFFF0DBAF),
                    title: 'Book',
                    subtitle: 'find best books for you',
                    icon: Icons.book_outlined,
                  ),
                  BotVarient(
                    color: Color(0xFF9BA17B),
                    title: 'Play Games',
                    subtitle: 'find best books for you',
                    icon: Icons.gamepad,
                  ),
                  BotVarient(
                    color: Color(0xFFADE4DB),
                    title: 'Solve Doubt',
                    subtitle: 'find best books for you',
                    icon: Icons.lightbulb_outline,
                  ),
                  BotVarient(
                    color: Color(0xFFF0DBAF),
                    title: 'Book',
                    subtitle: 'find best books for you',
                    icon: Icons.book_outlined,
                  ),
                  BotVarient(
                    color: Color(0xFF9BA17B),
                    title: 'Play Games',
                    subtitle: 'find best books for you',
                    icon: Icons.gamepad,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
