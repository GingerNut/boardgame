
import 'dart:math';


import 'package:boardgame/boardgame.dart';
import 'package:boardgame/src/board.dart';
import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/computer/computer_player.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/response/game_error.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

abstract class Game {

  final NewGame settings;

  GameState _state = GameState.waitingForPlayers;

  set state(GameState newState){
    _state = newState;
  }

  GameState get state =>_state;

  Board board;

  Game(this.settings);

  int get numberOfPlayers => settings.numberOfPlayers;
  Position position;
  PlayerList get players => settings.players;
  String get id => settings.id;

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

  Future<Response> initialise() async{
    position = getPosition(null);
    position.initialise();
    position.setupFirstPosition();

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

    history.clear();

    _state = GameState.waitingForAllReady;

    Response response = Success();
    players.forEach((p) async{

      Response playerRespnse = await p.getReady();

      if (playerRespnse is GameError) response = GameError.playerOutOfTime(p.id);
    });

    if(response is GameError) return response;

    _state = GameState.started;

    position.player.yourTurn(position);

    return response;
  }

  getPosition(Position parent);

  Response makeMove(Move move) {
    Response response = move.checkLegal(position);

    if(response is GameError) return response;

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
    return Success();
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