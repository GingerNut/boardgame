


import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/server/player_database.dart';

abstract class Server {
  static const String waitingForPlayers = 'W';
  static const String waitingForAllReady = 'T';
  static const String started = 'S';
  static const String paused = 'P';
  static const String finished = 'F';
  static const String none = 'O';
  static const String startNewGame = 'G';
  static const String move = 'M';
  static const String checkGameStatus = 'K';
  static const String chat = "H";
  static const String connection = 'C';
  static const String apply = 'A';
  static const String login = 'L';
  static const String success = 'U';
  static const String fail = 'I';
  static const String getAllUsers = 'E';
  static const String clearPlayers = 'R';

  PlayerDatabase database = PlayerDatabase();

  PlayerList playerQueue = PlayerList();
  List<Game> gamesAdvertised = new List();


  startGame();


  }










