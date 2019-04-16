

import 'dart:async';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/settings.dart';

abstract class Interface{

  Settings settings;
  Game game;
  bool inputOpen = false;
  Player interfacePlayer;

  final StreamController<GameMessage> events = StreamController.broadcast();
  final StreamController<GameMessage> changeScreen = StreamController.broadcast();

  go(Player player){
    interfacePlayer = player;
    inputOpen = true;
  }

  setUpNewGame();

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


