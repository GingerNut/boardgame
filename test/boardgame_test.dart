

import 'package:boardgame/boardgame.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

import 'package:boardgame/src/settings.dart';
import 'package:test/test.dart';

import 'test_game/move_fie.dart';
import 'test_game/move_fo.dart';
import 'test_game/move_fum.dart';
import 'test_game/move_number.dart';
import 'test_game/test_interface.dart';
import 'test_game/test_move.dart';

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

      expect(MoveFie().check(ui.game.position).runtimeType, Success().runtimeType);
      ui.game.makeMove(MoveFie());  // out - move should be MoveNumber
      expect(ui.players[0].status(ui.game.position), PlayerStatus.out);
      ui.game.makeMove(MoveNumber());  // OK - move should be MoveNumber
      expect(ui.players[1].status(ui.game.position), PlayerStatus.playing);
      expect(ui.game.position.playersLeft, 3);
      expect((ui.game.position.player.status(ui.game.position)), PlayerStatus.playing);
      ui.game.makeMove(MoveFie());  // OK - move should be MoveNumber
      expect(ui.game.position.playersLeft, 3);
      expect((ui.game.position.player.status(ui.game.position)), PlayerStatus.playing);
      ui.game.makeMove(MoveFo());  // OK - move should be MoveNumber
      expect(ui.game.position.playersLeft, 2);
      expect((ui.game.position.player.status(ui.game.position)), PlayerStatus.playing);
      ui.game.makeMove(MoveFo());  // OK - move should be MoveNumber
      expect(ui.game.position.playersLeft, 2);
      expect((ui.game.position.player.status(ui.game.position)), PlayerStatus.playing);
      ui.game.makeMove(MoveNumber());  // OK - move should be MoveNumber
      expect(ui.game.position.playersLeft, 1);
      expect(ui.game.gameOver, true);
    });



    test('setting game state ', () async {



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

    test('Stinged moves', (){

      expect(TestMove.getMove(MoveFie().string).runtimeType, MoveFie().runtimeType);
      expect(TestMove.getMove(MoveFum().string).runtimeType, MoveFum().runtimeType);
      expect(TestMove.getMove(MoveFo().string).runtimeType, MoveFo().runtimeType);
      expect(TestMove.getMove(MoveNumber().string).runtimeType, MoveNumber().runtimeType);
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