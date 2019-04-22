

import 'dart:async';
import 'package:boardgame/src/computer/computer.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/server/game_server.dart';
import 'package:boardgame/src/settings.dart';

abstract class Interface{
  GameServer server;
  Computer computer;
  Settings settings = Settings();
  Game game;
  bool inputOpen = false;
  Player interfacePlayer;

  final StreamController<GameMessage> events = StreamController.broadcast();
  final StreamController<GameMessage> changeScreen = StreamController.broadcast();

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  startServer(Game game) {

    if(server == null) server = getServer();

    messagesOut = new StreamController<String>();

    server.listeningPort(this, messagesOut.stream);

    messagesOut.add('hello from interface');

  }

  getServer();

  receivePort(Stream<String> stream){
    messagesIn = stream;
    stream.listen((m) => message(m));
  }

  message(String m);

  go(Player player){
    interfacePlayer = player;
    inputOpen = true;
  }

  Game createNewGame(Settings settings);

  setUpNewGame(){

    startServer(game);

    //TODO ask server to start a new game with settings
    //TODO turn settings into and back from a string
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


