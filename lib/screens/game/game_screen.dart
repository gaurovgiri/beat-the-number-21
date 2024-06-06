import 'package:beat_the_number_21/providers/player_provider.dart';
import 'package:beat_the_number_21/screens/game/widgets/turn_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/available_moves.dart';

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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed("/");
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ))
                ],
              ),
              backgroundColor: player.playerColor,
              body: const Column(
                children: [TurnText(), AvailableMoves()],
              )),
        );
      },
    );
  }
}
