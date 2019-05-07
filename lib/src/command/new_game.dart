


import 'package:boardgame/src/command/command.dart';
import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/player_list.dart';


class NewGame extends Command{
  GameHost host;
  String id;
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