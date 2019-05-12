

import 'package:boardgame/src/player.dart';

import 'test_move.dart';
import 'test_position.dart';

// multiples of 3 and 5

class MoveFum extends TestMove{
  static const String type ='fum';
  MoveFum.fromString(String string) : super.fromString(string);

    MoveFum() : super ();

  String toString() => type;

  doMove(TestPosition position){
    bool moveOk = false;
    int test = (position.parent as TestPosition).number;
    if(test % 3 == 0 && test % 5 == 0) moveOk = true;
    if(!moveOk) player.setStatus(position, PlayerStatus.out);
  }





}