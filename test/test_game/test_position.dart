

import 'package:boardgame/boardgame.dart';
import 'package:boardgame/src/player_list.dart';

class TestPosition extends Position{
  TestPosition(Game game) : super(game);

  int number;

  setupFirstPosition() {
    number = 1;
    playerOrder = PlayerOrder.countUp;
    player = game.players[0];
  }

  setUpNewPosition(){
    number ++;
  }


  analyse() {

  }

  checkWin() {
    if(playersLeft == 1) winner = survivors.first;

  }

  String toString(){
    String string = '';

//TODO stringify a position


  }




}