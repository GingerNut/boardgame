


import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/response/response.dart';


abstract class Command{
  static const String newGame = 'new';

  bool good = true;

  static Translation translate(String string){

    String type = string.substring(0,2);
    String content = string.substring(2);

    Translation translation;
    Command command;

    switch (string.substring(0,2)){

      case newGame:

        command = NewGame.fromString(content);
        translation = command.good ? Translation.bad() : Translation(command);
        break;



    }


    return translation;
  }







}


class Translation extends Response{

  String response;
  Command command;

  Translation.bad(){
    response = 'unknown command';
  }

  Translation(this.command);


}