

import 'package:boardgame/src/computer/computer.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/server/server.dart';
import 'package:boardgame/src/settings.dart';


abstract class GameServer extends Server{

  static const String waitingForPlayers = 'W';
  static const String waitingForAllReady = 'A';
  static const String started = 'S';
  static const String paused = 'P';
  static const String finished = 'F';
  static const String none = 'O';
  static const String startNewGame = 'G';
  static const String move = 'M';
  static const String checkGameStatus = 'K';
  static const String chat = "H";
  static const String connection = 'C';


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
        message = waitingForPlayers;
        break;

      case GameState.finished:
        message = finished;
        break;

      case GameState.none:
        message = none;
        break;

      case GameState.paused:
        message = paused;
        break;

      case GameState.started:
        message = started;
        break;

      case GameState.waitingForAllReady:
        message = waitingForAllReady;
        break;


    }

    messagesOut.add(message);

  }

  message(String m){

    switch(m[0]){

      case startNewGame: newGame(Settings.fromString(m.substring(1)));
      break;

      case checkGameStatus: updateState();
      break;


    }

  }


  newGame(Settings settings) async{

    game = getGame(settings);

    await game.initialise();

    messagesOut.add(waitingForPlayers);
  }




}