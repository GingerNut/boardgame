


import 'package:boardgame/src/response/response.dart';

class LoginToken extends Response{

    final String token;
    final String playerId;


    LoginToken(this.playerId, this.token);


}