


import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/server/server.dart';

import 'test_game.dart';

class TestServer extends Server{

  getNewGame(NewGame details) => TestGame(details);













}