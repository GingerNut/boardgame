


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';

abstract class Position{

  final Game game;
  final Position parent;
  Move move;
  List<PlayerStatus> playerStatus;
  List<double> score;
  Player _player;
  PlayerList get players => game.players;
  set player (Player newPlayer) => _player = newPlayer;
  int get playersLeft => players.playersLeft(this);
  PlayerList get survivors => players.remainingPlayers(this);

  Player get player{
    if(parent == null) return _player;

    if(_player != null) return _player;

    if(players.playersLeft(this) == 0 ) return null;

    if( players.playersLeft(this)== 1) _player = players.remainingPlayers(this).first;

    _player = players.getPlayer(this);

    return _player;
    }
  PlayerOrder playerOrder;

  Player winner;

  Position(this.game, this.parent);

  makeMove(Move move){
    this.move = move;
    move.go(this);
  }

  initialise(){
    playerStatus = new List(game.players.length);
    score = new List(game.players.length);

    if(parent != null) {
      for(int i = 0 ; i < game.players.length ; i ++){
        playerStatus[i] = parent.playerStatus[i];
        score[i] = parent.score[i];
        playerOrder = parent.playerOrder;
      }

      copyVariables();

    }
  }

  copyVariables();

  setupFirstPosition();

  analyse();

  checkWin();

}

