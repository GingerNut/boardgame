


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
  GameTimer timer;
  String id = '?';
  String displayName;
  Player nextPlayer;

  double get timeLeft => timer.timeLeft;
  double score(Position position) => position.score[number];

  Future<Response> getReady()async{

    Response response = await initialise();

    return response;
  }

  Future<Response> initialise()async{
    color = Palette.defaultPlayerColours[number];
    timer = GameTimer(this, game.settings.gameTime, moveTime: game.settings.moveTime);

    return Success();
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