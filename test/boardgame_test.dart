

import 'package:boardgame/boardgame.dart';
import 'package:boardgame/src/player.dart';

import 'package:boardgame/src/settings.dart';
import 'package:test/test.dart';

import 'test_game/move_fie.dart';
import 'test_game/test_interface.dart';

void main() {
  group('Set up a new game', () {
    TestInterface ui = TestInterface();

    setUp(() {

    });

    test('Start a game against three computers ', () async {
      await ui.addLocalPlayer(ComputerPlayer());
      expect(ui.players.listAllNames(), ['Player 1', 'Computer 1']);

      await ui.addLocalPlayer(Player());
      expect(ui.players.listAllNames(), ['Player 1', 'Computer 1', 'Player 2']);

      await ui.addLocalPlayer(ComputerPlayer());
      expect(ui.players.listAllNames(), ['Player 1', 'Computer 1', 'Player 2', 'Computer 2']);

      ui.startLocalGame();
      expect(ui.game.players.length, 4);
      expect(ui.game.players.listAllNames(), ['Player 1', 'Computer 1', 'Player 2', 'Computer 2']);
      expect(ui.game.id, 'local game');

      ui.game.makeMove(MoveFie());
    });

    test('setting game state ', () async {
;


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



    test('Setting up basic server ', () async{



    });




  },
//      skip: 'must have server working'
  );



//  group('Server tests ', (){
//
//    HttpGameServer gameServer = HttpGameServer();
//
//    TestInterface ui = TestInterface();
//
//    setUp(() async{
//     await gameServer.connectLocalhost();
//     await gameServer.clearPlayers();
//    });
//
//    test('Setting up basic server ', () async{
//
//       expect(await gameServer.postRequest(Server.apply + 'harry'), Server.apply + 'harry');
//       expect(await gameServer.postRequest(Server.apply + 'jane'), Server.apply + 'jane');
//       expect(await gameServer.postRequest(Server.getAllUsers), Server.getAllUsers + 'harry\njane\n');
//
//    });
//
//    tearDown(() async {
//     await  gameServer.tidyUp();
//    });
//
//
//  },
//      skip: 'must have server working'
//  );






}