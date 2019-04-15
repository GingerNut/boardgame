


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_timer.dart';
import 'package:boardgame/src/position.dart';

class Player{
  static const int human = 0;
  static const int computer = 1;
  static const int internet = 2;

  final Game game;
  final int number;
  int color;
  String reasonOut;
  GameTimer timer;

  Player(this.game, this.number);


  yourTurn(Position position){}

  outOfTime(){}

}


enum PlayerStatus{
  winner,
  disconnected,
  out,
  waiting,
  playing
}