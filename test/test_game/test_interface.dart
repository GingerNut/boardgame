


import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/interface/interface.dart';

import 'test_game.dart';
import 'test_server.dart';


class TestInterface extends Interface{

  getServer() => TestServer();
  getGame(NewGame details) => TestGame(details);




}