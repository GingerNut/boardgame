import 'dart:async';

import 'package:boardgame/src/server/game_server.dart';

import 'test_game.dart';
import 'test_interface.dart';

class TestServer extends GameServer{



  message(String m){

    print(m);

    messagesOut.add('hello from server');

  }





}