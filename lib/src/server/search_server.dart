

import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/server/chatter.dart';

import 'package:boardgame/src/server/server.dart';

class SearchServer extends Server{


  PlayerList playerQueue = PlayerList();
  List<Game> gamesAdvertised = new List();

  SearchServer(){

    chatter = Chatter(this, playerQueue);
  }





  message(String s) {

  }
























}