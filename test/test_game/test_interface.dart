


import 'package:boardgame/src/interface/interface.dart';
import 'package:boardgame/src/settings.dart';

import 'test_game.dart';
import 'test_server.dart';

class TestInterface extends Interface{

  createNewGame(Settings settings) => TestGame(settings);

  getServer() => TestServer();





}