
import 'package:boardgame/src/server/game_server.dart';

import 'test_game.dart';


class TestServer extends GameServer{

  TestGame game;


  message(String m){

    print(m);

    messagesOut.add('hello from server');

  }





}