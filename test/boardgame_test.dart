
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/settings.dart';
import 'package:test/test.dart';

import 'test_game/test_interface.dart';

void main() {

  group('Set up a new game', () {

    TestInterface ui = TestInterface();

    setUp(() {

    });

    test('Start a game against three computers ', () async{
      await ui.setUpNewGame();

      expect(ui.server.game.settings.numberOfPlayers, ui.settings.numberOfPlayers);
      expect(ui.server.game.settings.playerType, ui.settings.playerType);
      expect(ui.server.game.settings.timer, ui.settings.timer);
      expect(ui.server.game.settings.gameTime, ui.settings.gameTime);
      expect(ui.server.game.settings.moveTime, ui.settings.moveTime);

      ui.events.stream.listen((s){
        expect(ui.gameState, GameState.waitingForPlayers);
      });



    });

    test('setting game state ', () async{
      await ui.setUpNewGame();

      ui.server.game.state = GameState.waitingForPlayers;
      ui.server.game.state = GameState.none;
      ui.server.game.state = GameState.waitingForAllReady;
      ui.server.game.state = GameState.started;
      ui.server.game.state = GameState.paused;
      ui.server.game.state = GameState.finished;




    });




  });

  group('Settings tests ', () {

    test('Stingify ', (){
      Settings settings = Settings();
      Settings stringed = Settings.fromString(settings.string);

      expect(settings.numberOfPlayers, stringed.numberOfPlayers);
      expect(settings.playerType, stringed.playerType);
      expect(settings.timer, stringed.timer);
      expect(settings.gameTime, stringed.gameTime);
      expect(settings.moveTime, stringed.moveTime);

    });

    test('Stingify ', (){
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






}
