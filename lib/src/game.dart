

import 'package:boardgame/src/input.dart';
import 'package:boardgame/src/move.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';

class Game{

  final Input input;
  int numberOfPlayers;
  Position position;
  List<Player> players;
  List<Move> history = new List();

  Game(this.input){
    input.game = this;
  }

  setup()async{}

  newGame(){

  position = Position (this, null, null);

  position.initialise();

  players = new List(numberOfPlayers);

  for(int i = 0 ; i < numberOfPlayers ; i ++){


    for (int i = 0 ; i < numberOfPlayers ; i ++){
      Player player = new Player(this, i);

      players.add(player);
      position.playerStatus[i] = PlayerStatus.waiting;
    }

  }

  position.player = players[0];

  position.player.yourTurn(position);

  history.clear();

  input.setUpNewGame();

}

  makeMove(){


}



}