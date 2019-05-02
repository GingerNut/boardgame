

import 'package:boardgame/src/computer/computer.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/server/chatter.dart';
import 'package:boardgame/src/server/server.dart';
import 'package:boardgame/src/settings.dart';


abstract class GameServer extends Server{

  Game game;
  Computer computer;



  join(String playerDetails){


  }

  kick(String playerDetails){


  }

  getGame(Settings settings);

  updateState(){

    String message;

    switch (game.state){

      case GameState.waitingForPlayers:
        message = Server.waitingForPlayers;
        break;

      case GameState.finished:
        message = Server.finished;
        break;

      case GameState.none:
        message = Server.none;
        break;

      case GameState.paused:
        message = Server.paused;
        break;

      case GameState.started:
        message = Server.started;
        break;

      case GameState.waitingForAllReady:
        message = Server.waitingForAllReady;
        break;


    }

    messagesOut.add(message);

  }

  message(String m){

    switch(m[0]){

      case Server.startNewGame:
        newGame(Settings.fromString(m.substring(1)));
        chatter = Chatter(game.players);
      break;

      case Server.checkGameStatus: updateState();
      break;


    }

  }


  newGame(Settings settings) async{

    game = getGame(settings);

    await game.initialise();

    messagesOut.add(Server.waitingForPlayers);
  }




}