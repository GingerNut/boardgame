


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_timer.dart';
import 'package:boardgame/src/position.dart';

class Player{

  final Game game;
  final int number;
  int color;
  String reasonOut;
  GameTimer timer;

  Player(this.game, this.number);


  yourTurn(Position position){}

  outOfTime(){

  }

}

enum PlayerStatus{
  winner,
  disconnected,
  out,
  waiting,
  playing
}