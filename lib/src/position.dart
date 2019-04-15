


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/move.dart';
import 'package:boardgame/src/player.dart';

class Position{

  final Game game;
  final Position parent;
  Move move;
  List<PlayerStatus> playerStatus;
  Player player;

  Player winner;

  Position(this.game, this.parent);

  makeMove(Move move){
    this.move = move;
  }

  initialise(){}

  analyse(){}

  checkWin(){}

}