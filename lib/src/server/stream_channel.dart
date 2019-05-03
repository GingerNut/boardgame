

import 'dart:async';

import 'package:boardgame/src/server/channel.dart';

class StreamChannel extends Channel{

  StreamController messageOut = StreamController();

  handshake(Channel other) {

  }

  Stream get receive => messageOut.stream;


}