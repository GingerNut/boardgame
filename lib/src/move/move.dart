


import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/response/game_error.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

abstract class Move <T> {
  bool legal = false;
  String error;
  Player player;

  Move();

  Move.fromString(String string);

  Response check(T position){

    this.player = (position as Position).player;

    return doCheck(position);
  }

  Response doCheck(T position);

  Response go(T position){

      doMove(position);
      return Success();
  }

  doMove(T position);


}