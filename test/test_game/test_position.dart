

import 'package:boardgame/boardgame.dart';

class TestPosition extends Position{
  TestPosition(Game game, Position parent) : super(game, parent);

  int number;

  setupFirstPosition() {
    number = 0;
  }


  analyse() {
    number ++;
  }

  checkWin() {
    print('checking for win in test position');
  }




}