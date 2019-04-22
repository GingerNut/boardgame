

import 'dart:async';

import 'package:boardgame/src/interface/interface.dart';


abstract class GameServer{

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  listeningPort(Interface interface, Stream stream){
    messagesIn = stream;
    messagesIn.listen((m) => message(m));
    messagesOut = StreamController<String>();
    interface.receivePort(messagesOut.stream);
  }

  message(String m);




}