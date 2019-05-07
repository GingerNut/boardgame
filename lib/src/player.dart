


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_timer.dart';
import 'package:boardgame/src/palette.dart';
import 'package:boardgame/src/position.dart';

class Player{
  static const int human = 0;
  static const int computer = 1;
  static const int internet = 2;

  Game game;
  int number;
  int color;
  String reasonOut;
  GameTimer timer;
  String id;
  String displayName;
  Player nextPlayer;

  double get timeLeft => timer.timeLeft;
  double score(Position position) => position.score[number];


  initialise(){
    color = Palette.defaultPlayerColours[number];
    timer = GameTimer(this, game.settings.gameTime, moveTime: game.settings.moveTime);
  }


  yourTurn(Position position){

    
  }

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