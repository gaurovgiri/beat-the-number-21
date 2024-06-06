import 'package:beat_the_number_21/screens/home/widgets/buttons.dart';
import 'package:beat_the_number_21/screens/home/widgets/title.dart';
import 'package:beat_the_number_21/screens/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFF98479F),
        body: Column(
          children: [
            SizedBox(height: getHeight(context) * 0.4, child: const Logo()),
            SizedBox(
                height: getHeight(context) * 0.3,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavButton(
                        text: "Player Vs CPU",
                        color: "Green",
                        navigateTo: "/playervscpu"),
                    NavButton(
                        text: "Player Vs Player",
                        color: "Green",
                        navigateTo: "/playervsplayer")
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
