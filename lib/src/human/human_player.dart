


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';

class HumanPlayer extends Player with Human{
  HumanPlayer(Game game, int number) : super(game, number);

}

mixin Human on Player{

yourTurn(Position position) {
}


}