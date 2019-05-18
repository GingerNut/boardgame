


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/interface/player.dart';
import 'package:boardgame/src/player_list.dart';

abstract class Position{

  final Game game;
  Move lastMove;

  PlayerList get players => game.players;
  int get playersLeft => players.playersLeft(this);
  PlayerList get survivors => players.remainingPlayers(this);

  String toString();

  Player player;

  PlayerOrder playerOrder;

  Player winner;

  Position(this.game);

  makeMove(Move move){
    move.go(this);
    lastMove = move;
  }

  setNextPlayer(){
    Player next;
    switch(playerOrder){
      case PlayerOrder.countUp:
        next = players[(player.number + 1) % players.length];
        while(next.playerStatus != PlayerStatus.playing){
          next = players[(next.number + 1) % players.length];
        }
        break;
      case PlayerOrder.countDown:
        next = players[(player.number - 1) % players.length];
        while(next.playerStatus != PlayerStatus.playing){
          next = players[(next.number - 1) % players.length];
        }
        break;
      case PlayerOrder.random:
      // TODO: Handle this case.
        break;
      case PlayerOrder.firstToPlay:
      // TODO: Handle this case.
        break;
      case PlayerOrder.highestScore:
      // TODO: Handle this case.
        break;
      case PlayerOrder.lowersScore:
      // TODO: Handle this case.
        break;
    }
     player = next;
  }

  setupFirstPosition();

  setUpNewPosition();

  analyse();

  checkWin();

}

