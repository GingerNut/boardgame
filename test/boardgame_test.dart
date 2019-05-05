

import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/server/http_server.dart';
import 'package:boardgame/src/server/server.dart';
import 'package:boardgame/src/settings.dart';
import 'package:test/test.dart';

import 'test_game/test_interface.dart';

void main() {
  group('Set up a new game', () {
    TestInterface ui = TestInterface();

    setUp(() {

    });

    test('Start a game against three computers ', () async {
      await ui.setUpNewGame();


    });

    test('setting game state ', () async {
      await ui.setUpNewGame();

    });
  });

  group('Settings tests ', () {
    test('Stingify ', () {
      Settings settings = Settings();
      Settings stringed = Settings.fromString(settings.string);

      expect(settings.numberOfPlayers, stringed.numberOfPlayers);
      expect(settings.playerType, stringed.playerType);
      expect(settings.timer, stringed.timer);
      expect(settings.gameTime, stringed.gameTime);
      expect(settings.moveTime, stringed.moveTime);
    });

    test('Stingify ', () {
      Settings settings = Settings();

      settings.numberOfPlayers = 3;
      settings.playerType = Player.computer;
      settings.timer = false;

      Settings stringed = Settings.fromString(settings.string);

      expect(settings.numberOfPlayers, stringed.numberOfPlayers);
      expect(settings.playerType, stringed.playerType);
      expect(settings.timer, stringed.timer);
      expect(settings.gameTime, stringed.gameTime);
      expect(settings.moveTime, stringed.moveTime);
    });
  });


  group('Chat ', () {

    test('Basic chat', () {

    });
  });


  group('Search server ', (){

    HttpGameServer server = HttpGameServer();

    test('Setting up basic server ', () async{



    });




  },
//      skip: 'must have server working'
  );



  group('Server tests ', (){

    HttpGameServer gameServer = HttpGameServer();

    TestInterface ui = TestInterface();

    setUp(() async{
     await gameServer.connectLocalhost();
     await gameServer.clearPlayers();
    });

    test('Setting up basic server ', () async{

       expect(await gameServer.postRequest(Server.apply + 'harry'), Server.apply + 'harry');
       expect(await gameServer.postRequest(Server.apply + 'jane'), Server.apply + 'jane');
       expect(await gameServer.postRequest(Server.getAllUsers), Server.getAllUsers + 'harry\njane\n');

    });

    tearDown(() async {
     await  gameServer.tidyUp();
    });


  },
//      skip: 'must have server working'
  );






}