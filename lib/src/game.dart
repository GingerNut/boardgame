

import 'package:boardgame/src/board.dart';
import 'package:boardgame/src/computer/computer_player.dart';
import 'package:boardgame/src/human/human_player.dart';
import 'package:boardgame/src/internet/internet_player.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/settings.dart';

abstract class Game {
  Settings settings;
  Board board;

  int get numberOfPlayers => players.length;
  Position position;
  List<Player> players;
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

  newGame() {
    position = Position(this, null);

    position.initialise();

    players = new List(numberOfPlayers);

    for (int i = 0; i < numberOfPlayers; i ++) {
      for (int i = 0; i < numberOfPlayers; i ++) {
        Player player;

        switch (Settings.playerType) {
          case Player.human:
            player = new HumanPlayer(this, i);
            break;

          case Player.computer:
            player = new ComputerPlayer(this, i);
            break;

          case Player.internet:
            player = new InternetPlayer(this, i);
            break;
        }

        players.add(player);
        position.playerStatus[i] = PlayerStatus.waiting;
      }
    }

    position.player = players[0];

    position.player.yourTurn(position);

    history.clear();
  }

  makeMove(Move move) {
    Position newPosition = Position(this, position);
    newPosition.initialise();
    newPosition.makeMove(move);
    newPosition.analyse();

    position = newPosition;

    if (gameOver) {
      history.add(move);
    } else {

    }
  }

}

enum Status{
  waiting,
  started,
  finished
}