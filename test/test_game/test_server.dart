


import 'package:boardgame/src/command/new_game.dart';

import 'package:boardgame/src/server/server.dart';

import 'test_game.dart';
import 'test_move_builder.dart';

class TestServer extends Server{

  getNewGame(NewGame newGame) => TestGame(newGame);

  getMoveBuilder() => TestMoveBuilder();
}