import 'package:beat_the_number_21/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class PlayerProvider extends ChangeNotifier {
  GameController game = GameController();
  Color playerColor = const Color(0xFFB73737);
  late int currentPlayer;
  late int previousPlayer;
  bool isCpu = false;

  PlayerProvider() {
    currentPlayer = (game.turn == 0) ? 1 : 2;
    previousPlayer = (game.turn == 0) ? 2 : 1;
  }

  void cpuPlay() {
    List<int> moves = game.currentMoves;
    int randomIndex = Random().nextInt(moves.length);
    int selectedMove = moves[randomIndex];
    playMove(selectedMove);
  }

  void playMove(int num) {
    game.selectNumber(num);
    playerColor =
        (game.turn == 0) ? const Color(0xFFB73737) : const Color(0xFF5839D4);
    currentPlayer = (game.turn == 0) ? 1 : 2;
    previousPlayer = (game.turn == 0) ? 2 : 1;

    if (isCpu && currentPlayer == 2) {
      Timer(Duration(seconds: Random().nextInt(2) + 1), () {
        cpuPlay();
      });
    }

    notifyListeners();
  }

  void resetGame() {
    game.resetGame();
    currentPlayer = (game.turn == 0) ? 1 : 2;
    playerColor =
        (game.turn == 0) ? const Color(0xFFB73737) : const Color(0xFF5839D4);
  }
}
