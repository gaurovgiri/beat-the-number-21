import 'package:beat_the_number_21/main.dart';
import 'package:beat_the_number_21/providers/player_provider.dart';
import 'package:beat_the_number_21/screens/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Moves extends StatelessWidget {
  final int move;
  const Moves({super.key, required this.move});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, player, child) => SizedBox(
        width: 84,
        height: 69,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 2,
              backgroundColor: const Color(0xFFDDE113),
            ),
            onPressed: () {
              if (player.canPlay) {
                audioPlayer.selectMove(true);
                player.playMove(move);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("You cannot play your move"),
                  duration: Duration(seconds: 2),
                ));
              }
            },
            child:
                Text(move.toString(), style: const TextStyle(fontSize: 28.44))),
      ),
    );
  }
}

class AvailableMoves extends StatelessWidget {
  const AvailableMoves({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context) * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Available Choices: ",
            style: TextStyle(color: Colors.white),
          ),
          Consumer<PlayerProvider>(
              builder: (context, player, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: player.game.currentMoves
                      .map((move) => Moves(move: move))
                      .toList())),
        ],
      ),
    );
  }
}
