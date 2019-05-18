import 'dart:async';

import 'package:boardgame/src/command/command.dart';
import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/server/channel.dart';

class StreamChannel extends Channel{
  StreamChannel otherEnd;

  StreamController messagesOut = StreamController<String>();

  StreamChannel(GameHost host) : super(host);

  static handshake(StreamChannel one, StreamChannel two){
    one.otherEnd = two;
    two.otherEnd = one;

    two.initialise();
    one.initialise();
  }

  initialise(){
    otherEnd.messagesOut.stream.listen((d) => host.handleString(d));
  }

  @override
  sendMessage(String string) {
   messagesOut.add(string);
  }


  Future<String> requestResponse(String string) async{



  }




}