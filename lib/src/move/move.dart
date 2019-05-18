


import 'package:boardgame/src/interface/player.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

abstract class Move <P>{
  bool legal = false;
  String error;


  Response check(P position){

    return doCheck(position);
  }

  Response doCheck(P position);

  Response go(P position){

      doMove(position);
      return Success();
  }

  doMove(P position);


}