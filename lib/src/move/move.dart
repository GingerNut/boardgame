


import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';

abstract class Move{
  bool legal = false;
  Position position;
  String error;
  Player player;

  String get string;

  Move.fromString(String string){


  }

  String setup(Position position) =>'OK';

  String move(Position position) => 'OK';

  checkLegal(Position position) {
    this.position = position;
    error = setup(position);
    if(error == 'OK') legal = true;
  }

  String go(Position position) {
    String error = setup(position);
    if(error == 'OK') return move(position);
    else return error;
  }

}