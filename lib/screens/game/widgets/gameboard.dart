import 'package:beat_the_number_21/screens/game/widgets/gameappbar.dart';
import 'package:flutter/material.dart';
import 'package:beat_the_number_21/screens/game/widgets/turn_text.dart';
import 'package:beat_the_number_21/screens/game/widgets/available_moves.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Column(
        children: [
          GameAppBar(),
          TurnText(),
          AvailableMoves(),
        ],
      ),
    );
  }
}
