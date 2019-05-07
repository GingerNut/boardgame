


import 'package:boardgame/src/command/command.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/server/server.dart';

class NewGame extends Command{
  Server server;
  PlayerList players = new PlayerList();
  int numberOfPlayers;
  int playerType;
  bool playerHelp;
  bool timer;
  double moveTime;
  double gameTime;

  NewGame();

  NewGame.fromString(String details){


  }




}