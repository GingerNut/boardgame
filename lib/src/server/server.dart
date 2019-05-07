


import 'package:boardgame/src/command/command.dart';
import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/server/player_database.dart';

abstract class Server {

  PlayerDatabase database = PlayerDatabase();

  PlayerList playerQueue = PlayerList();
  List<Game> games = new List();

  Game getNewGame(NewGame newGame);

  Future<Response> handle(String string) async{

    Translation translation = Command.translate(string);

    if(translation.command == null) return translation;

    Command command = translation.command;

    switch(command.runtimeType){

      case NewGame:
        Game game = getNewGame(command);
        game.initialise();
        games.add(game);
        break;



    }







    return Translation.bad();

  }






}










