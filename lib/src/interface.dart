


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';

abstract class Interface{

  Game game;


  go(Player player){}

  setUpNewGame();
}