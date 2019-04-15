


import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';

abstract class Move{

  Player player;

  String setup(Position position) =>'OK';

  String move(Position position) => 'OK';

  String checkLegal(Position position) => setup(position);

  String go(Position position) {
    String error = setup(position);
    if(error == 'OK') return move(position);
    else return error;
  }

}