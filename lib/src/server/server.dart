


import 'dart:math';

import 'package:boardgame/src/command/command.dart';

import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/game_list.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/move/move_factory.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/response/game_error.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';
import 'package:boardgame/src/server/player_database.dart';

abstract class Server extends GameHost{

  Server(){

    moveFactory = getMoveFactory();

  }

  PlayerDatabase database = PlayerDatabase();
  Random random = Random();
  PlayerList playerQueue = PlayerList();

  List<NewGame> adverts = new List();
  GameList _games = GameList();
  MoveFactory moveFactory;
  getMoveFactory();

  List<String> get games => _games.listAllGames();

  Game getGame(NewGame newGame);

  Future<Response> handle(String string) async{

    String type = string.substring(0,3);
    String details = string.substring(3);

    switch(type) {

      case Command.newGame:
        NewGame settings = NewGame.fromString(details);
        settings.id = randomGameId();
        adverts.add(settings);
        break;

      case Command.move:
        Move move = moveFactory.createMove(details);
        if(move == null) return GameError.badMove(details);
        //Game game = _games.getGameWithId(id);

        break;


      default:
        break;

    }




    return Success();
  }


  String randomGameId(){

    String id = 'game' + (random.nextDouble() * 10000).truncate().toString();

    while(_games.containsGameWithId(id)){
      id = 'game' + (random.nextDouble() * 10000).truncate().toString();
    }

    return id;

  }

}










