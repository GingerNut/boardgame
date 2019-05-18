

import 'dart:io';



import 'package:boardgame/src/response/response.dart';

class LoginToken extends Response{

    final String playerSecret;
    final String playerId;
    WebSocket socket;

    LoginToken(this.playerId, this.playerSecret, this.socket);


}