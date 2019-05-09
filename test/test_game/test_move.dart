


import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

import 'test_position.dart';

abstract class TestMove extends Move<TestPosition>{
  TestMove.fromString(String string) : super.fromString(string);

  TestMove() : super();

  doCheck(TestPosition position) => Success();

  doMove(TestPosition position);

}