


import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/response/response.dart';

import 'create_move.dart';


abstract class Command{
  static const String delimiter = '\n';
  static const String newGame = 'new';
  static const String move = 'mov';
  static const String joinGame = 'joi';
  static const String login = 'log';
  static const String startGame = 'sta';

}


