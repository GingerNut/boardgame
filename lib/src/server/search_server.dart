

import 'dart:convert';
import 'dart:io';

import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/server/chatter.dart';

import 'package:boardgame/src/server/server.dart';
import 'package:boardgame/src/server/user_database.dart';

class SearchServer extends Server{

  UserDatabase database = UserDatabase();

  PlayerList playerQueue = PlayerList();
  List<Game> gamesAdvertised = new List();

  SearchServer(){

    chatter = Chatter(this, playerQueue);
  }





  message(String s) {
//TODO message
  }



  handleGet(HttpRequest request){
    String reply ='Hello world!';

    request.response
      ..write(reply)
      ..close();

  }

  handlePost(HttpRequest request) async{
    String payload = await request.transform(Utf8Decoder()).join();
    var username = Uri.splitQueryString(payload)['username'];

    database.addPlayer(username);

    database.printAll();
  }

  bool addPlayer(String name) => database.addPlayer(name);






}