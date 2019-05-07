

import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/position.dart';

import 'test_position.dart';

// multiples of 3

class MoveFie extends Move{
  MoveFie.fromString(String string) : super.fromString(string);

  MoveFie(){}

  @override
  // TODO: implement string
  String get string => null;


 go(Position position){

  if((position as TestPosition).number % 3 != 0) player.out();

  return 'OK';
 }


}