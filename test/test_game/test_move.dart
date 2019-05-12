


import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/move/move_factory.dart';

import 'package:boardgame/src/response/success.dart';

import 'move_fie.dart';
import 'move_fo.dart';
import 'move_fum.dart';
import 'move_number.dart';
import 'test_position.dart';

abstract class TestMove extends Move<TestPosition>{
  TestMove.fromString(String string) : super.fromString(string);

  TestMove() : super();

  doCheck(TestPosition position) => Success();

  doMove(TestPosition position);

  static TestMove getMove(String string){

    switch(string){
      case 'fie' : return MoveFie();
      case 'fo' : return MoveFo();
      case 'fum' : return MoveFum();
      case 'num' : return MoveNumber();
    }
    return null;
  }

}

class TestMoveFactory extends MoveFactory<TestMove>{

  TestMove createMove(String string) {

    switch(string){
    case MoveFie.type:
      return MoveFie();

      case MoveFo.type:
        return MoveFo();

      case MoveFum.type:
        return MoveFum();

      case MoveNumber.type:
        return MoveNumber();

      default:
        return null;
    }

  }




}