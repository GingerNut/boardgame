


import 'test_move.dart';
import 'test_position.dart';

// multiples of 3

class MoveFie extends TestMove{
  static const String type ='fie';

  MoveFie.fromString(String string) : super.fromString(string);

  MoveFie() : super();

  String toString() => type;



  doMove(TestPosition position) {
      bool moveOk = false;

      int test = (position.parent as TestPosition).number;

      if(test % 3 == 0 && test % 5 != 0) moveOk = true;

      if(!moveOk) player.out(position);

  }




}