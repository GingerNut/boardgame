


import 'dart:math';

import 'package:boardgame/src/command/command.dart';

import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/database/database.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/game_list.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/move/move_factory.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/response/game_error.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';


abstract class Server extends GameHost{

  Database db = Database();

  Server(){

    moveFactory = getMoveFactory();

  }

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
        settings.host = this;
        adverts.add(settings);
        break;

      case Command.joinGame:
        NewGame newGame = adverts.singleWhere((g) => g.id == details);
        if(newGame == null)return GameError.gameNotFound();
        Response response = await newGame.requestJoin(details);
        if(response is GameError) return response;
        print('rt');
        if(newGame.full) {
          print('here');
          Game game = getGame(newGame);
          _games.add(game);
          adverts.remove(newGame);
          await game.initialise();
        }

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

  Response login(String id){

    Player player = new Player()
        ..id = id;

    playerQueue.add(player);
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










