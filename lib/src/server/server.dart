

import 'dart:async';
import 'dart:io';

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
  static const String apply = 'A';
  static const String login = 'L';
  static const String success = 'U';
  static const String fail = 'I';
  static const String getAllUsers = 'E';

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  Chatter chatter;

  listeningPort(Server server, Stream otherMessagesIn){
    messagesIn = otherMessagesIn;
    messagesIn.listen((m) => serverMessage(m));

    if(messagesOut == null){
      messagesOut = StreamController.broadcast();
      server.listeningPort(this, messagesOut.stream);
    }

  }

  handShakeServer(Server server){
    messagesOut = StreamController<String>();

    server.listeningPort(this, messagesOut.stream);

  }


  serverMessage(String s){

    switch(s[0]){

      case Server.chat: chatter.chatReceived(s.substring(1));
      break;


      default: message(s);
      break;
    }



  }

  chatSend(String text, String from, [String to]){

    String message = Server.chat;
    message += '\n';
    message += from;
    message += '\n';
    (to != null) ? message += to : message += '';
    message += '\n';
    message += text;
    message += '\n';

    messagesOut.add(message);
  }

  message(String s);




}