

import 'package:boardgame/src/response/response.dart';

class Success extends Response{

  String render;

  Success.login(String playerId){

    render = 'Successful login for player ' + playerId;
  }

  Success();



}