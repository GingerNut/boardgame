


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';


class InternetPlayer extends Player with Internet{
  InternetPlayer(Game game, int number) : super(game, number);
}



mixin Internet on Player{

yourTurn(Position position){

}

}




