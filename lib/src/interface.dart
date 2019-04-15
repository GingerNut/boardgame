


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';

abstract class Interface{

  Game game;
  bool inputOpen = false;
  Player interfacePlayer;

  go(Player player){
    interfacePlayer = player;
    inputOpen = true;
  }

  setUpNewGame();

  redraw();
}