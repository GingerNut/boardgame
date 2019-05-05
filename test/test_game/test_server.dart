



import 'package:boardgame/src/server/game_server.dart';
import 'package:boardgame/src/settings.dart';

import 'test_game.dart';


class TestServer extends GameServer{

  getGame(Settings settings) => TestGame(settings, this);

  @override
  handleGet(String string) {
    // TODO: implement handleGet
    return null;
  }

  @override
  handlePost(String string) {
    // TODO: implement handlePost
    return null;
  }








}