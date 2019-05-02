


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_timer.dart';
import 'package:boardgame/src/palette.dart';
import 'package:boardgame/src/position.dart';

abstract class Player{
  static const int human = 0;
  static const int computer = 1;
  static const int internet = 2;

  final Game game;
  final int number;
  int color;
  String reasonOut;
  GameTimer timer;
  String id;
  Player nextPlayer;

  double get timeLeft => timer.timeLeft;
  double score(Position position) => position.score[number];

  Player(this.game, this.number){

    color = Palette.defaultPlayerColours[number];
    timer = GameTimer(this, game.settings.gameTime, moveTime: game.settings.moveTime);
  }


  yourTurn(Position position);

  wait(){

  }

  outOfTime(){
    Position position = game.position;

    position.playerStatus[number] = PlayerStatus.out;
    position.checkWin();
  }

}


enum PlayerStatus{
  winner,
  disconnected,
  out,
  waiting,
  playing
}