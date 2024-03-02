import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gemini_chatbot/screens/chat/text/chat_screen.dart';

class SmallSearchContainer extends StatelessWidget {
  const SmallSearchContainer({
    super.key,
    this.ontap,
    required this.color,
    required this.svgImagePath,
    required this.title,
  });

  final Function()? ontap;
  final Color color;
  final String svgImagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black26,
                      child: SvgPicture.asset(
                        svgImagePath,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
              child: Text(title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class LargeSearchContainer extends StatelessWidget {
  const LargeSearchContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatScreen()));
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
                padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 20)),
              ),
            ],
          ),
        ));
  }
}
