


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';

class HumanPlayer extends Player with Human{


}

mixin Human on Player{

yourTurn(Position position) {
}


}