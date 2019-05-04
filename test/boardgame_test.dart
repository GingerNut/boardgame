
import 'dart:io';
import 'dart:convert';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/human/human_player.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/server/search_server.dart';
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

      expect(ui.server.game.settings.numberOfPlayers, ui.settings.numberOfPlayers);
      expect(ui.server.game.settings.playerType, ui.settings.playerType);
      expect(ui.server.game.settings.timer, ui.settings.timer);
      expect(ui.server.game.settings.gameTime, ui.settings.gameTime);
      expect(ui.server.game.settings.moveTime, ui.settings.moveTime);

      Future<String> string = ui.messagesIn.first;

      expect(await string, 'W');

    });

    test('setting game state ', () async {
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
    TestInterface ui = TestInterface();
    SearchServer server = SearchServer();
    ui.handShakeServer(server);

    server.playerQueue.add(HumanPlayer()
      ..id = 'henry');
    server.playerQueue.add(HumanPlayer()
      ..id = 'steve');
    server.playerQueue.add(HumanPlayer()
      ..id = 'john');
    server.playerQueue.add(HumanPlayer()
      ..id = 'jeff');

    test('Basic chat', () {
      ui.chatSend('hello', 'henry', 'john');
    });
  });


  group('Server tests ', (){

    HttpServer server;
    Uri url;

    Future<String> request([String details])async{

      String reply;

      var request = await HttpClient().getUrl(url);

      // sends the request
      var response = await request.close();

      // transforms and prints the response
      await for (var contents in response.transform(Utf8Decoder())) {
        reply = contents;
      }

      return reply;
    }

    setUp(() async{
      server = await HttpServer.bind('localhost', 0);
      url = Uri.parse("http://${server.address.host}:4040");
    });

    test('Setting up basic server ', () async{

      String reply = await request();

       await print(reply);


    });

    tearDown(() async {
      await server.close(force: true);
      server = null;
      url = null;
    });


  },
//      skip: 'must have server working'
  );







}