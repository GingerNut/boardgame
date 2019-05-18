

import 'package:boardgame/boardgame.dart';
import 'package:boardgame/src/command/command.dart';
import 'package:boardgame/src/command/join_game.dart';
import 'package:boardgame/src/command/make_move.dart';
import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/command/start_game.dart';
import 'package:boardgame/src/database/record.dart';
import 'package:boardgame/src/interface/player.dart';
import 'package:boardgame/src/response/game_error.dart';
import 'package:boardgame/src/response/login_token.dart';
import 'package:boardgame/src/response/success.dart';
import 'package:boardgame/src/server/server.dart';

import 'package:boardgame/src/settings.dart';
import 'package:test/test.dart';

import 'test_game/move_fie.dart';
import 'test_game/move_fo.dart';
import 'test_game/move_fum.dart';
import 'test_game/move_number.dart';
import 'test_game/test_interface.dart';
import 'test_game/test_move.dart';
import 'test_game/test_move_builder.dart';
import 'test_game/test_position.dart';
import 'test_game/test_server.dart';

void main() {

  setUpPlayerDatabase(Server server) async{

    server.playerQueue.clear();
    server.adverts.clear();

    await server.db.addRecord(new Record()
      ..id = 'henry'
      ..displayName = 'Henry'
      .. password ='h1234'
      ..email = 'henry@email.com');

    await server.db.addRecord(new Record()
      ..id = 'james'
      ..displayName = 'Jim'
      .. password ='j1234'
      ..email = 'jim@email.com');

    await server.db.addRecord(new Record()
      ..id = 'sarah'
      ..displayName = 'Sarah'
      .. password ='s1234'
      ..email = 'sarah@email.com');

    await server.db.addRecord(new Record()
      ..id = 'emma'
      ..displayName = 'Emma'
      .. password ='e1234'
      ..email = 'emma@email.com');

    await server.db.addRecord(new Record()
      ..id = 'trace'
      ..displayName = 'Tracy'
      .. password ='t1234'
      ..email = 'tracy@email.com');

  }


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
      ui.game.makeMove(MoveFie());  // out - move should be MoveNumber 123
      expect(ui.players[0].playerStatus, PlayerStatus.out);
      ui.game.makeMove(MoveNumber());  // OK - move should be MoveNumber
      expect(ui.players[1].playerStatus, PlayerStatus.playing);
      expect(ui.game.position.playersLeft, 3);
      expect(ui.game.position.player.playerStatus, PlayerStatus.playing);
      ui.game.makeMove(MoveFie());  // OK - move should be MoveNumber
      expect(ui.game.position.playersLeft, 3); // wromg
      expect((ui.game.position.player.playerStatus), PlayerStatus.playing);
      ui.game.makeMove(MoveFo());  // bad - move should be MoveNumber
      expect(ui.game.position.playersLeft, 2);  //12
      expect((ui.game.position.player.playerStatus), PlayerStatus.playing);
      ui.game.makeMove(MoveFo());  // OK - move should be MoveNumber
      expect(ui.game.position.playersLeft, 2);
      expect((ui.game.position.player.playerStatus), PlayerStatus.playing);
      ui.game.makeMove(MoveNumber());  // OK - move should be MoveNumber
      expect(ui.game.position.playersLeft, 1);
      expect(ui.game.gameOver, true);
      expect(ui.game.position.winner.number, 1);
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

      TestMoveBuilder builder = TestMoveBuilder();

      expect(builder.build(MoveFie().toString()).runtimeType, MoveFie);
      expect(builder.build(MoveFum().toString()).runtimeType, MoveFum);
      expect(builder.build(MoveFo().toString()).runtimeType, MoveFo);
      expect(builder.build(MoveNumber().toString()).runtimeType, MoveNumber);
    });

    test('Stinged position', ()async{







    });


  });


  group('Chat ', () {

    test('Basic chat', () {

    });
  });



  group('Search server ', (){

    TestServer server = TestServer();

    setUp(() async{

      await setUpPlayerDatabase(server);

    });

    test('database',() async{

      expect((await server.db.getRecordWithId('henry')).password, 'h1234');
      expect((await server.db.getRecordWithDisplayName('Tracy')).password, 't1234');
      expect((await server.db.getRecordWithEmail('emma@email.com')).password, 'e1234');

    });

    test('Logging in ', () async{

      LoginToken henry_token =  await server.login('henry', 'h1234');
      LoginToken james_token =  await server.login('james', 'j1234');
      LoginToken sarah_token =  await server.login('sarah', 's1234');
      LoginToken emma_token =  await server.login('emma', 'e1234');
      LoginToken trace_token =  await server.login('trace', 't1234');

     expect( henry_token.playerId , 'henry');
     expect( await server.login('henry', 'h1234'), GameError.alreadyLoggedIn('henry'));

      expect( james_token.playerId , 'james');
      expect( sarah_token.playerId , 'sarah');
      expect( emma_token.playerId , 'emma');
      expect( trace_token.playerId , 'trace');


    });








  },
//      skip: 'must have server working'
  );

  group('logged in players', (){

    TestServer server = TestServer();

    String henry_token;
    String james_token;
    String sarah_token;
    String emma_token;
    String trace_token;

    setUp(() async{

      await setUpPlayerDatabase(server);

      LoginToken henry_token_login =  await server.login('henry', 'h1234');
      LoginToken james_token_login =  await server.login('james', 'j1234');
      LoginToken sarah_token_login  =  await server.login('sarah', 's1234');
      LoginToken emma_token_login  =  await server.login('emma', 'e1234');
      LoginToken trace_token_login  =  await server.login('trace', 't1234');

      henry_token =  henry_token_login.playerSecret;
      james_token =  james_token_login.playerSecret;
      sarah_token =  sarah_token_login.playerSecret;
      emma_token =  emma_token_login.playerSecret;
      trace_token =  trace_token_login.playerSecret;


    });

    test('advertsing' , ()async{

      expect(server.playerQueue.length, 5);

      NewGame newGame = NewGame()
        ..numberOfPlayers = 4
        ..gameTime = 300
        ..moveTime = 5
        ..timer = true
        ..playerHelp = false;

      String instructions = '';
      instructions += Command.newGame;
      instructions += newGame.toString();

      await server.handle(instructions);

      expect(server.adverts.length,1);
      NewGame advert = server.adverts[0];

      await advert.requestJoin('henry', henry_token);
      expect(advert.players.length, 1);

      await advert.requestJoin('james', james_token);
      expect(advert.players.length, 2);

      await advert.requestJoin('james', james_token);
      expect(advert.players.length, 2);

      await advert.requestJoin('trace', trace_token);
      expect(advert.players.length, 3);

      expect(advert.full, false);

      await advert.requestJoin('sarah', sarah_token);
      expect(advert.players.length, 4);
      expect(advert.full, true);



      //expect(server.games.length, 1);
      //expect(server.adverts.length , 0);

    });

    test('join by command' , ()async{

      expect(server.playerQueue.length, 5);

      NewGame newGame = NewGame()
        ..numberOfPlayers = 4
        ..gameTime = 300
        ..moveTime = 5
        ..timer = true
        ..playerHelp = false;

      String instructions = '';
      instructions += Command.newGame;
      instructions += newGame.toString();

      await server.handle(instructions);

      expect(server.adverts.length,1);
      NewGame advert = server.adverts[0];

      String gameId = advert.id;

      await  server.handle(JoinGame(gameId, 'henry', henry_token).toString());
      expect(advert.players.length, 1);

      await  server.handle(JoinGame(gameId, 'james', james_token).toString());
      expect(advert.players.length, 2);

      await  server.handle(JoinGame(gameId, 'james', james_token).toString());
      expect(advert.players.length, 2);

      await  server.handle(JoinGame(gameId, 'trace', trace_token).toString());
      expect(advert.players.length, 3);

      expect(advert.full, false);

      await  server.handle(JoinGame(gameId, 'sarah', sarah_token).toString());
      expect(advert.players.length, 4);
      expect(advert.full, true);

      await server.handle(StartGame(gameId, 'sarah', sarah_token).toString());

      expect(await server.gameIds.length, 1);
      expect(await server.adverts.length , 0);

      expect(await server.gameIds[0], gameId);

      MakeMove move = MakeMove(gameId, 'henry', henry_token, MoveNumber().toString(), );
      
      expect(await server.handle(move.toString()), Success());



    });

    test('running a game on server', (){




    });


    test('advertsing using string command' , ()async{

//      expect(server.playerQueue.length, 5);
//
//      NewGame newGame = NewGame()
//        ..numberOfPlayers = 4
//        ..gameTime = 300
//        ..moveTime = 5
//        ..timer = true
//        ..playerHelp = false;
//
//      String instructions = '';
//      instructions += Command.newGame;
//      instructions += newGame.string;
//
//      await server.handle(instructions);
//
//      expect(server.adverts.length,1);
//      NewGame advert = server.adverts[0];
//
//      await advert.requestJoin('henry', henry_token);
//      expect(advert.players.length, 1);
//
//      await advert.requestJoin('james', james_token);
//      expect(advert.players.length, 2);
//
//      await advert.requestJoin('james', james_token);
//      expect(advert.players.length, 2);
//
//      await advert.requestJoin('trace', trace_token);
//      expect(advert.players.length, 3);
//
//      expect(advert.full, false);
//
//      await advert.requestJoin('sarah', sarah_token);
//      expect(advert.players.length, 4);
//      expect(advert.full, true);

      //expect(server.games.length, 1);
      //expect(server.adverts.length , 0);

    });




  });




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