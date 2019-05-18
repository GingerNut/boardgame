


import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/interface/interface.dart';
import 'package:boardgame/src/server/stream_channel.dart';

import 'test_game.dart';


class TestInterface extends Interface{


  getGame(NewGame details) => TestGame(details);




  loginToLocalTestServer(String id, String password){

  }

}