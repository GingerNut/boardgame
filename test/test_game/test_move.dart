


import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/move/move_builder.dart';

import 'package:boardgame/src/response/success.dart';

import 'move_fie.dart';
import 'move_fo.dart';
import 'move_fum.dart';
import 'move_number.dart';
import 'test_position.dart';

abstract class TestMove extends Move<TestPosition>{

  doCheck(TestPosition position) => Success();

  doMove(TestPosition position);

}

