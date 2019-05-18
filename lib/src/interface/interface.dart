

import 'dart:async';
import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/computer/computer_player.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/game_host.dart';
import 'package:boardgame/src/interface/player.dart';
import 'package:boardgame/src/player_list.dart';

import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/response/game_error.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

import 'package:boardgame/src/server/server.dart';

import 'package:boardgame/src/settings.dart';

abstract class Interface extends GameHost{

  //TODO include bluetooth connectivity

  PlayerList players = PlayerList();

  Game game;

  Game getGame(NewGame details);
  Server getServer();
  Server server;

  GameState gameState = GameState.none;

  Settings settings = Settings();

  bool inputOpen = false;
  Position position;
  String currentUser;

  final StreamController<GameMessage> events = StreamController.broadcast();
  final StreamController<GameMessage> changeScreen = StreamController.broadcast();

  Future<Response> addLocalPlayer(Player player) async{

    if(player.game != null ) return GameError.alreadyInGame(player.id, game.id);

    if(players.isEmpty) players.add(Player());

    if(players.length < settings.numberOfPlayers) players.add(player);


    players.forEach((p){
      if(p.displayName == null){

        String base;

        if(p is ComputerPlayer) base = 'Computer';
        else base = 'Player';

        int trialInt = 1;

        String trialName = base + ' ' + trialInt.toString();

        while(players.containsPlayerWithDisplayName(trialName)){
            trialInt ++;
            trialName = base + ' ' + trialInt.toString();

        }
        p.displayName = trialName;
      }


    });

        return Success.login(player.id);

    }


  removeLocalPlayer(Player player) => players.remove(player);

  startLocalGame(){

    NewGame newGame = NewGame()
        ..host = this
        ..id= 'local game'
        ..players = players
        ..numberOfPlayers = players.length
        ..gameTime = settings.gameTime
        ..moveTime = settings.moveTime
        ..timer = settings.timer
        ..playerHelp = false;

    game = getGame(newGame);

    game.initialise();
  }

  redraw(){
    events.add(GameMessage(Event.reDraw));
  }

  tidyUpOnClose(){
    events.close();
    changeScreen.close();
  }




}

enum Event{
  newGame,
  reDraw,
  goToHelpScreen,
  goToStartScreen,
  goToWinScreen,
  goToGameScreen,
  gameOver
}

class GameMessage{

  final Event event;

  GameMessage(this.event);

}


