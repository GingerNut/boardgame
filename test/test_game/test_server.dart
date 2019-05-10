


import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/move/move_factory.dart';
import 'package:boardgame/src/server/server.dart';

import 'test_game.dart';
import 'test_move.dart';

class TestServer extends Server{

  getNewGame(NewGame details) => TestGame(details);

  getMoveFactory() => TestMoveFactory();


  Game getGame(NewGame newGame) => TestGame(newGame);













}