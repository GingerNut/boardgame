


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/player.dart';

abstract class Position{

  final Game game;
  final Position parent;
  Move move;
  List<PlayerStatus> playerStatus;
  List<double> score;
  Player player;

  Player winner;

  Position(this.game, this.parent);

  makeMove(Move move){
    this.move = move;
    analyse();
  }

  initialise(){
    playerStatus = new List(game.settings.numberOfPlayers);
    score = new List(game.settings.numberOfPlayers);
    if(parent != null) copyVariables();
  }

  copyVariables();

  setupFirstPosition();

  analyse();

  checkWin();

}