

import 'dart:async';

import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/interface/interface.dart';
import 'package:boardgame/src/settings.dart';


abstract class GameServer{

  Game game;

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  listeningPort(Interface interface, Stream stream){
    messagesIn = stream;
    messagesIn.listen((m) => message(m));
    messagesOut = StreamController<String>();
    interface.receivePort(messagesOut.stream);
  }

  message(String m){

    List<String> message = m.split("\n");

    switch(message[0]){

      case 'N': newGame(Settings());


    }

  }

  newGame(Settings settings);




}