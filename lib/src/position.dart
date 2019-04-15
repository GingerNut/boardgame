


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/move.dart';
import 'package:boardgame/src/player.dart';

class Position{

  final Game game;
  final Position parent;
  final Move move;
  List<PlayerStatus> playerStatus;
  Player player;

Player winner;

  Position(this.game, this.parent, this.move);

  initialise(){}

  analyse(){}

  checkWin(){}

}