class GameController {
  late List<int> currentMoves;
  late int previousMove;
  int turn = 0;
  bool hasFinished = false;

  GameController() {
    currentMoves = _generateMoves(0);
    previousMove = -1;
  }

  List<int> _generateMoves(int num) {
    List<int> moves = [];
    for (int move = num + 1; move <= num + 3; move++) {
      if (move > 21) {
        break;
      } else {
        moves.add(move);
      }
    }
    return moves;
  }

  void selectNumber(int num) {
    if (num == 21) {
      hasFinished = true;
    }
    currentMoves = _generateMoves(num);
    previousMove = num;
    turn = (turn == 0) ? 1 : 0;
  }

  void resetGame() {
    hasFinished = false;
    turn = 0;
    previousMove = -1;
    currentMoves = _generateMoves(0);
  }
}
