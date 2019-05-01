
import 'package:boardgame/src/server/game_server.dart';
import 'package:boardgame/src/settings.dart';

import 'test_game.dart';


class TestServer extends GameServer{




  newGame(Settings settings){

    game = TestGame(settings);

    game.initialise();

    messagesOut.add('R');
  }



}