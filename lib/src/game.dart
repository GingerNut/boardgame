

import 'package:boardgame/src/computerPlayer.dart';
import 'package:boardgame/src/humanPlayer.dart';
import 'package:boardgame/src/input.dart';
import 'package:boardgame/src/internetPlayer.dart';
import 'package:boardgame/src/move.dart';
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/settings.dart';

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

      Player player;

      switch(Settings.playerType){
        case Player.human: player = new HumanPlayer(this, i);
        break;

        case Player.computer: player = new ComputerPlayer(this, i);
        break;

        case Player.internet: player = new InternetPlayer(this, i);
        break;
      }

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