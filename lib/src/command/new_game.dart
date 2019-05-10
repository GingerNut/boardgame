


import 'dart:math';

import 'package:boardgame/src/command/command.dart';
import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/player_list.dart';


class NewGame extends Command{
  GameHost host;
  String id;
  String displayName ='';
  PlayerList players = new PlayerList();
  int numberOfPlayers;
  int playerType;
  bool playerHelp;
  bool timer;
  double moveTime;
  double gameTime;

  bool get full => players.length == numberOfPlayers;
  NewGame();

  addPlayerFromPlayerList(PlayerList players, String id){
    if(full) return;

    players.add(players.getPlayerWithId(id));
  }


  NewGame.fromString(String details){

    List<String> detailList = details.split('\n');

    this.displayName = detailList[0];
    this.numberOfPlayers = int.parse(detailList[1]);
    this.timer = detailList[2] == 'TRUE' ? true : false;
    this.moveTime = double.parse(detailList[3]);
    this.gameTime = double.parse(detailList[4]);
  }

  String get string {

    String string = '';
    string += displayName;
    string += '\n';
    string += numberOfPlayers.toString();
    string += '\n';
    string += timer ? 'TRUE' : 'FALSE';
    string += '\n';
    string += moveTime.toString();
    string += '\n';
    string += gameTime.toString();
    string += '\n';

    return string;
  }






}