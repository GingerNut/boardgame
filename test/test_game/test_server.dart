
import 'package:boardgame/src/server/game_server.dart';
import 'package:boardgame/src/settings.dart';

import 'test_game.dart';


class TestServer extends GameServer{

  getGame(Settings settings) => TestGame(settings, this);






}