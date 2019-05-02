

import 'dart:async';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/interface/login.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/server/game_server.dart';
import 'package:boardgame/src/server/server.dart';
import 'package:boardgame/src/settings.dart';

abstract class Interface extends Server{
  Login login;
  GameServer server;
  GameState gameState = GameState.none;

  Settings settings = Settings();

  bool inputOpen = false;
  Position position;
  String playerId;

  final StreamController<GameMessage> events = StreamController.broadcast();
  final StreamController<GameMessage> changeScreen = StreamController.broadcast();

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  startServer() {

    if(server == null) server = getGameServer();

    handShakeServer(server);

  }

  getLogin(Login login);

  getGameServer();

  checkGameStatus() => messagesOut.add(GameServer.checkGameStatus);

  message(String m){

    switch(m[0]){

      case GameServer.waitingForPlayers:
        gameState = GameState.waitingForPlayers;
        events.add(GameMessage(Event.reDraw));
        break;

      case GameServer.finished:
        gameState = GameState.finished;
        break;

      case GameServer.none:
        gameState = GameState.none;
        break;

      case GameServer.paused:
        gameState = GameState.paused;
        break;

      case GameServer.started:
        gameState = GameState.started;
        break;

      case GameServer.waitingForAllReady:
        gameState = GameState.waitingForAllReady;
        break;


    }

  }



  go(String id){
    playerId = id;
    inputOpen = true;
  }

  setUpNewGame() async{

    startServer();

    messagesOut.add(GameServer.startNewGame + settings.string);

    //TODO start the game and initialise computers
  }

  redraw(){
    events.add(GameMessage(Event.reDraw));
  }

  tidyUpOnClose(){
    events.close();
    changeScreen.close();
  }
}

enum Event{
  newGame,
  reDraw,
  goToHelpScreen,
  goToStartScreen,
  goToWinScreen,
  goToGameScreen,
  gameOver
}

class GameMessage{

  final Event event;

  GameMessage(this.event);

}


