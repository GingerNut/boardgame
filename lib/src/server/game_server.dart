

import 'dart:async';

import 'package:boardgame/src/computer/computer.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/interface/interface.dart';
import 'package:boardgame/src/settings.dart';


abstract class GameServer{

  Game game;
  Computer computer;

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  listeningPort(Interface interface, Stream stream){
    messagesIn = stream;
    messagesIn.listen((m) => message(m));
    messagesOut = StreamController<String>();
    interface.receivePort(messagesOut.stream);
  }

  getGame(Settings settings);

  message(String m){

    switch(m[0]){

      case 'N': newGame(Settings.fromString(m.substring(1)));
      break;


    }

  }


  newGame(Settings settings) async{

    game = getGame(settings);

    await game.initialise();

    messagesOut.add('W');
  }




}