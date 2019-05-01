


import 'package:boardgame/src/interface/interface.dart';
import 'package:boardgame/src/settings.dart';

import 'test_game.dart';
import 'test_server.dart';

class TestInterface extends Interface{

  TestGame createNewGame(Settings settings) => TestGame(settings);

  getServer() => TestServer();


    message(String m){

      List<String> message = m.split("\n");

      switch(message[0]){

        case 'R': print('game ready');


      }



  }


}