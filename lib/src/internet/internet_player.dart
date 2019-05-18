


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/interface/player.dart';
import 'package:boardgame/src/position.dart';


class InternetPlayer extends Player with Internet{

}



mixin Internet on Player{

yourTurn(Position position){

}

}




