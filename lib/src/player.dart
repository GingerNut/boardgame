


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
  String secret;
  String displayName;
  String gameId;
  PlayerStatus playerStatus = PlayerStatus.waiting;

  double get timeLeft => timer.timeLeft;
  double score(Position position) => position.score[number];
  PlayerStatus status(Position position) => position.playerStatus[number];

  Future<Response> getReady()async{

    Response response = await initialise();

    return response;
  }

  Future<Response> initialise()async{
    color = Palette.defaultPlayerColours[number];
    timer = GameTimer(this, game.settings.gameTime, moveTime: game.settings.moveTime);

    if(game.id == 'local game') setStatus(game.position, PlayerStatus.ready);

    return Success();
  }


  yourTurn(Position position){
    
  }

  setStatus(Position position, PlayerStatus status) => position.playerStatus[number] = status;

  wait(){

  }

  outOfTime(){
    Position position = game.position;

    position.playerStatus[number] = PlayerStatus.out;
    position.checkWin();
  }

  out(Position position){

    position.playerStatus[number] = PlayerStatus.out;

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