
import 'package:boardgame/boardgame.dart';
import 'package:boardgame/src/response/response.dart';

import 'test_move.dart';
import 'test_position.dart';


// multiples of 5

class MoveFo extends TestMove{
  static const String type ='fo';

  String toString() => type;



  doMove(TestPosition position) {
    bool moveOk = false;
    int test = position.number;
    if(test % 3 != 0 && test % 5 == 0) moveOk = true;
    if(!moveOk) position.player.playerStatus = PlayerStatus.out;
  }





}