import 'package:beat_the_number_21/providers/player_provider.dart';
import 'package:beat_the_number_21/screens/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TurnText extends StatelessWidget {
  const TurnText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getHeight(context) * 0.6,
        child: Consumer<PlayerProvider>(
          builder: (context, player, child) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Player ${(player.currentPlayer)}'s Turn",
                  style: const TextStyle(fontSize: 28.44, color: Colors.white),
                ),
                Text(
                  textAlign: TextAlign.center,
                  !player.game.previousMove.isNegative
                      ? "Player ${player.previousPlayer} played \n ${player.game.previousMove}"
                      : "",
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ));
  }
}
