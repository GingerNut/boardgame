

import 'dart:async';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/interface/user.dart';

import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/server/game_server.dart';
import 'package:boardgame/src/server/server.dart';
import 'package:boardgame/src/settings.dart';

abstract class Interface extends Server{

  User user = User();
  Set<User> users = Set();
  GameServer server;
  GameState gameState = GameState.none;


  Settings settings = Settings();

  bool inputOpen = false;
  Position position;
  String currentUser;

  final StreamController<GameMessage> events = StreamController.broadcast();
  final StreamController<GameMessage> changeScreen = StreamController.broadcast();

  connectToServer();

  tidyUp();

 // postRequest(String string);

 // getRequest(String string);

  startServer() {

    if(server == null) server = getGameServer();

    handShakeServer(server);

  }

  login(User user){
    if(users.length == 1 && users.last.displayName == User.defaultUser) users.clear();
    users.add(user);
  }

  logout(User user){
    users.remove(user);
  }

  getGameServer();

  checkGameStatus() => messagesOut.add(Server.checkGameStatus);

  message(String m){

    switch(m[0]){

      case Server.apply:
        user.id = m;
        break;

      case Server.getAllUsers:
        print(m);
        break;

      case Server.waitingForPlayers:
        gameState = GameState.waitingForPlayers;
        events.add(GameMessage(Event.reDraw));
        break;

      case Server.finished:
        gameState = GameState.finished;
        break;

      case Server.none:
        gameState = GameState.none;
        break;

      case Server.paused:
        gameState = GameState.paused;
        break;

      case Server.started:
        gameState = GameState.started;
        break;

      case Server.waitingForAllReady:
        gameState = GameState.waitingForAllReady;
        break;


    }

  }



  go(String id){
    currentUser = id;
    inputOpen = true;
  }

  setUpNewGame() async{
    
    if(users.isEmpty) users.add(
        User.getDefault()
    );

    startServer();

    messagesOut.add(Server.startNewGame + settings.string);

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


