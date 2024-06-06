import 'package:beat_the_number_21/screens/game/widgets/gameappbar.dart';
import 'package:beat_the_number_21/screens/game/widgets/gameboard.dart';
import 'package:beat_the_number_21/screens/game/widgets/playerwonmsg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beat_the_number_21/providers/player_provider.dart';

class GameScreen extends StatelessWidget {
  final bool cpu;
  const GameScreen({super.key, this.cpu = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, player, child) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: GameAppBar(),
            ),
            backgroundColor: player.playerColor,
            body: Stack(
              children: [
                Opacity(
                  opacity: player.game.hasFinished ? 0.2 : 1.0,
                  child: const GameBoard(),
                ),
                if (player.game.hasFinished)
                  PlayerWonMessage(
                    winner: 'Player ${player.currentPlayer} won!',
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
