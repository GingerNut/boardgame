


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';

class HumanPlayer extends Player{
  HumanPlayer(Game game, int number) : super(game, number);


  yourTurn(Position position) {
    game.ui.go(this);
  }


}