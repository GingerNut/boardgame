


import 'dart:async';

abstract class Channel{

  StreamController messageOut;

  Stream get receive;

  handshake(Channel other);




}