




import 'dart:io';

import 'package:boardgame/src/interface/interface.dart';
import 'package:boardgame/src/settings.dart';

import 'test_game.dart';
import 'test_server.dart';

class TestInterface extends Interface{

  createNewGame(Settings settings) => TestGame(settings, server);

  getGameServer() => TestServer();

  @override
  handleGet(HttpRequest request) {
    // TODO: implement handleGet
    return null;
  }

  @override
  handlePost(HttpRequest request) {
    // TODO: implement handlePost
    return null;
  }







}