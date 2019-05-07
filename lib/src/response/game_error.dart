

import 'package:boardgame/src/response/response.dart';

class GameError extends Response{

  String string;

  GameError.alreadyInGame(String playerId, String gameId);

  GameError.badMove(String playerId);

  GameError.playerOutOfTime(String playerId);

}