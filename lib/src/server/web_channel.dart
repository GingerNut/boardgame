import 'dart:io';

import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/server/channel.dart';

class WebChannel extends Channel{

  final WebSocket socket;

  WebChannel(GameHost host, this.socket) : super(host);



  receiveMessage(String string) {

  }


  sendMessage(String string) {

  }


  Future<String> requestAnswer(String string) async{}


}