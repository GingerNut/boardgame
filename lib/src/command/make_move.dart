


import 'package:boardgame/src/command/command.dart';

class MakeMove extends Command{
  final String gameId;
  final String move;
  final String playerId;
  final String token;

  MakeMove(this.gameId, this.move, this.playerId, this.token);

  String toString() => Command.move
      + gameId + Command.delimiter
      + move.toString() + Command.delimiter
      + playerId + Command.delimiter
      + token + Command.delimiter;

}