

import 'package:boardgame/src/player.dart';
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

    Server server = Server();

    test('Setting up basic server ', () async{

      expect(await server.message(Server.apply + 'harry'), Server.apply + 'harry');

    });




  },
//      skip: 'must have server working'
  );



  group('Server tests ', (){

    TestInterface ui = TestInterface();

    setUp(() async{
     await ui.connectToServer();
    });

    test('Setting up basic server ', () async{

       expect(await ui.postRequest(Server.apply + 'harry'), Server.apply + 'harry');
       expect(await ui.postRequest(Server.apply + 'jane'), Server.apply + 'jane');
       expect(await ui.postRequest(Server.getAllUsers), Server.getAllUsers + 'harry\njane\n');

    });

    tearDown(() async {
     await  ui.tidyUp();
    });


  },
//      skip: 'must have server working'
  );






}