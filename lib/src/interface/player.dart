


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_timer.dart';
import 'package:boardgame/src/palette.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

class Player{
  static const int human = 0;
  static const int computer = 1;
  static const int internet = 2;

  Game game;
  int number;
  int color;
  String reasonOut;
  double score;
  PlayerStatus playerStatus = PlayerStatus.waiting;

  GameTimer timer;
  String id = '?';
  String secret;
  String displayName;
  String gameId;

  double get timeLeft => timer.timeLeft;

  Future<Response> getReady()async{

    Response response = await initialise();

    return response;
  }

  Future<Response> initialise()async{
    color = Palette.defaultPlayerColours[number];
    timer = GameTimer(this, game.settings.gameTime, moveTime: game.settings.moveTime);

    if(game.id == 'local game') playerStatus = PlayerStatus.ready;

    return Success();
  }


  yourTurn(Position position){
    
  }

  wait(){

  }

  outOfTime(){
    Position position = game.position;

    playerStatus = PlayerStatus.out;
    position.checkWin();
  }


}


enum PlayerStatus{
  winner,
  disconnected,
  out,
  waiting,
  ready,
  playing
}