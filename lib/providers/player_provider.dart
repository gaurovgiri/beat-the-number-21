import 'package:beat_the_number_21/controllers/game_controller.dart';
import 'package:flutter/material.dart';

class PlayerProvider extends ChangeNotifier {
  GameController game = GameController();
  Color playerColor = const Color(0xFFB73737);
  late int currentPlayer;
  late int previousPlayer;

  PlayerProvider() {
    currentPlayer = (game.turn == 0) ? 1 : 2;
    previousPlayer = (game.turn == 0) ? 2 : 1;
  }

  void playMove(int num) {
    game.selectNumber(num);
    playerColor =
        (game.turn == 0) ? const Color(0xFFB73737) : const Color(0xFF5839D4);
    currentPlayer = (game.turn == 0) ? 1 : 2;
    previousPlayer = (game.turn == 0) ? 2 : 1;

    notifyListeners();
  }
}
