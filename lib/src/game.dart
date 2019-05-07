

import 'package:boardgame/src/board.dart';
import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/computer/computer_player.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/server/server.dart';

abstract class Game {

  final NewGame settings;

  GameState _state = GameState.waitingForPlayers;
  Server server;

  set state(GameState newState){
    _state = newState;
  }

  GameState get state =>_state;

  Board board;

  Game(this.settings);
  int get numberOfPlayers => settings.numberOfPlayers;
  Position position;
  PlayerList get players => settings.players;
  List<Move> history = new List();

  bool get gameOver => position.winner != null;

  String get string;

  bool get computerNeeded {
    if (settings.playerHelp) return true;

    for (int i = 0; i < players.length; i ++) {
      if (players[i] is ComputerPlayer) return true;
    }

    return false;
  }

  setup() async {}

  initialise() {
    position = getPosition(null);

    position.initialise();

    for (int i = 0; i < numberOfPlayers; i ++) {
      for (int i = 0; i < numberOfPlayers; i ++) {
        Player player = players[i];

        player.game = this;
        player.number = i;
        player.initialise();

        players[i] = player;
        position.playerStatus[i] = PlayerStatus.waiting;
      }
    }

    position.analyse();

    position.player = players[0];

    position.player.yourTurn(position);

    history.clear();

    _state = GameState.waitingForAllReady;
  }

  getPosition(Position parent);

  makeMove(Move move) {
    Position newPosition = getPosition(position);
    newPosition.initialise();
    newPosition.makeMove(move);
    newPosition.analyse();
    newPosition.checkWin();

    position = newPosition;

    if (gameOver) {
      history.add(move);
    } else {

    }
  }

}

enum GameState{
  none,
  waitingForPlayers,
  waitingForAllReady,
  started,
  paused,
  finished
}