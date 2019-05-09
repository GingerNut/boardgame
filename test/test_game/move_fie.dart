

import 'test_move.dart';
import 'test_position.dart';

// multiples of 3

class MoveFie extends TestMove{
  MoveFie.fromString(String string) : super.fromString(string);

  MoveFie() : super();

  String get string => null;



  doMove(TestPosition position) {
      bool moveOk = false;

      int test = (position.parent as TestPosition).number;

      if(test % 3 == 0 && test % 5 != 0) moveOk = true;

      if(!moveOk) player.out(position);

  }




}