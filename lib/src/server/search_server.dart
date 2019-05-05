

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/server/chatter.dart';

import 'package:boardgame/src/server/user_database.dart';

class Server {
  static const String waitingForPlayers = 'W';
  static const String waitingForAllReady = 'A';
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

  UserDatabase database = UserDatabase();

  PlayerList playerQueue = PlayerList();
  List<Game> gamesAdvertised = new List();



  handleResponse(HttpRequest request){

    switch(request.method){
      case 'GET': handleGet(request);
      break;

      case 'POST': handlePost(request);
      break;

      default:
        request.response
          ..statusCode = HttpStatus.methodNotAllowed
          ..write('Unsupported request: ${request.method}.')
          ..close();
        break;

    }

  }



  handleGet(HttpRequest request){
    String reply ='Hello world!';

    request.response
      ..write(reply)
      ..close();

  }

  handlePost(HttpRequest request) async{

    String payload = await request.transform(Utf8Decoder()).join();
    
    String reply = await message(payload);

    request.response
      ..write(reply)
      ..close();

  }

  Future<String> message(String m) async{

    String response = m[0];

    switch(m[0]){

      case Server.apply:
        response += await applyToJoin(m.substring(1));
        break;

      case Server.getAllUsers:
        response += await database.getAllUsers();
        break;


    }


    return response;
  }
  
  Future<String> applyToJoin(String string) async{

    if(string == '?') string = randomName();

    database.addPlayer(string);

    return string;
  }

  String randomName()=> _randomString(8);

  String _randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(
        length,
            (index){
          return rand.nextInt(26)+97;
        }
    );

    return new String.fromCharCodes(codeUnits);
  }



//bool addPlayer(String name) => database.addPlayer(name);


  }










