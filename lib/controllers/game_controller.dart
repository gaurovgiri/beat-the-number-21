class GameController {
  late List<int> currentMoves;
  late int previousMove;
  int turn = 0;

  GameController() {
    currentMoves = _generateMoves(0);
    previousMove = -1;
  }

  List<int> _generateMoves(int num) {
    return [num + 1, num + 2, num + 3];
  }

  void selectNumber(int num) {
    currentMoves = _generateMoves(num);
    previousMove = num;
    turn = (turn == 0) ? 1 : 0;
  }

  void resetGame() {
    turn = 0;
    previousMove = -1;
    currentMoves = _generateMoves(0);
  }
}
