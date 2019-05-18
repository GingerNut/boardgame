


import 'dart:io';
import 'dart:math';

import 'package:boardgame/src/command/command.dart';

import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/database/database.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/game_list.dart';
import 'package:boardgame/src/move/move.dart';
import 'package:boardgame/src/move/move_builder.dart';
import 'package:boardgame/src/interface/player.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/response/game_error.dart';
import 'package:boardgame/src/response/login_token.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';
import 'package:boardgame/src/server/internet_player.dart';


abstract class Server extends GameHost{

  Database db = Database();

  MoveBuilder moveBuilder;

  getMoveBuilder();
  getPlayer(WebSocket socket) => InternetPlayer(socket);

  Server(){

    moveBuilder = getMoveBuilder();
  }

  Random random = Random();
  PlayerList playerQueue = PlayerList();

  List<NewGame> adverts = new List();
  GameList _games = GameList();

  List<String> get gameIds => _games.listAllGames();


  Game getNewGame(NewGame newGame);


  Future<Response> handleRequest(HttpRequest request) async {

    if (request.uri.path == '/ws') {
      // Upgrade a HttpRequest to a WebSocket connection.
      var socket = await WebSocketTransformer.upgrade(request);

      handleWebSocket(socket);

    } else if(request.method == 'GET'){

    } else if(request.method == 'POST'){
      //String string = request.payload;
     // handleString(string);

    } else {
    request.response
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request: ${request.method}.')
    .. close();
    };


  }



  Future<Response> handleString(String string) async{

    Response response;

    String type = string.substring(0,3);
    String details = string.substring(3);

    switch(type) {

      case Command.newGame:
        NewGame settings = NewGame.fromString(details);
        settings.id = randomGameId();
        settings.host = this;
        adverts.add(settings);
        response = Success();
        break;

      case Command.joinGame:

        List<String> _d = details.split(Command.delimiter);

        String _game = _d[0];
        String _playerId = _d[1];
        String _token = _d[2];

        NewGame newGame = adverts.singleWhere((g) => g.id == _game);
        if(newGame == null)return GameError.gameNotFound();
        Response response = await newGame.requestJoin(_playerId, _token);
        if(response is GameError) return response;

        response =  Success();
        break;

      case Command.startGame:

        List<String> _d = details.split(Command.delimiter);

        String _gameId = _d[0];
        String _playerId = _d[1];
        String _token = _d[2];

        NewGame advert;

        adverts.forEach((a) {
          if(a.id == _gameId) advert = a;
        });

        if(advert == null) return GameError.gameNotFound();

        adverts.remove(advert);

        Player player = await playerQueue.getPlayerWithId(_playerId);
        if(player == null) return GameError.playerNotFound();
        if(player.secret != _token) return GameError.badCommand('player secret not corrent');

        Game _game = getNewGame(advert);

        await _game.initialise();

        _games.add(_game);

        response =  Success();
        break;

      case Command.move:
        List<String> _d = details.split(Command.delimiter);

        String _gameId = _d[0];
        String _playerId = _d[1];
        String _token = _d[2];
        String _moveDetails = _d[3];

        Game game = await _games.getGameWithId(_gameId);
        if(game == null) return GameError.gameNotFound();

        Player player = await playerQueue.getPlayerWithId(_playerId);
        if(player == null) return GameError.playerNotFound();
        if(player.secret != _token) return GameError.badCommand('player secret not corrent');

        if(game.position.player.id != player.id) return GameError.playerNotFound();

        Move move = moveBuilder.build(_moveDetails);
        if(move == null) return GameError.badMove(details);
        
        game.makeMove(move);

        response = Success();
      break;

      default:
        break;

    }

    return response;
  }

  Future<Response> login(String id, String password) async{

    if((await db.getRecordWithId(id)).password != password) return GameError.playerNotFound();

    String secret = getSecret();

    InternetPlayer player = new InternetPlayer(null)
        ..id = id
    .. secret = secret;
    
    if(playerQueue.containsPlayerId(id)) return GameError.alreadyLoggedIn(id);

    playerQueue.add(player);

    return LoginToken(id, secret);
  }

  String randomGameId(){

    String id = 'game' + (random.nextDouble() * 10000).truncate().toString();

    while(_games.containsGameWithId(id)){
      id = 'game' + (random.nextDouble() * 10000).truncate().toString();
    }

    return id;

  }

  String getSecret(){

    var rand = new Random();
    var codeUnits = new List.generate(
        16,
            (index){
          return rand.nextInt(33)+89;
        }
    );

    return new String.fromCharCodes(codeUnits);

  }

  void handleWebSocket(WebSocket socket){
    print('Client connected!');
    InternetPlayer player = getPlayer(socket);
    playerQueue.add(player);
  }

}










