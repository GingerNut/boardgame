

import 'dart:async';

import 'package:boardgame/src/server/chatter.dart';



abstract class Server{
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

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  Chatter chatter;

  listeningPort(Server server, Stream otherMessagesIn){
    messagesIn = otherMessagesIn;
    messagesIn.listen((m) => serverMessage(m));

    if(messagesOut == null){
      messagesOut = StreamController<String>();
      server.listeningPort(this, messagesOut.stream);
    }

  }

  handShakeServer(Server server){
    messagesOut = StreamController<String>();

    server.listeningPort(this, messagesOut.stream);

  }


  serverMessage(String s){

    switch(s[0]){

      case Server.chat: chatter.message(s.substring(1));
      break;


      default: message(s);
      break;
    }



  }

  message(String s);









}