


import 'dart:math';

import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/position.dart';


class GameList{


  List<Game> _games;

  GameList([int size]){

    if(size != null) _games = List(size);
    else _games = List();

  }

  operator [](int i) => _games[i];
  operator []=(int i, Game value) => _games[i] = value;

  add(Game game) => _games.add(game);
  remove(Game game) =>  _games.remove(game);
  bool get isEmpty => _games.isEmpty;
  int get length  => _games.length;

  clear() => _games.clear();
  forEach(Function(Game game) function) => _games.forEach(function);

  Game getGameWithId(String id){

    Game game;

    _games.forEach((p) {
      if(p.id == id) game = p;
    });

    return game;

  }

  containsGameWithId(String string){;

  bool containsGame = false;

  _games.forEach((p) {
    if(p.id == string) containsGame = true;
  });

  return containsGame;

  }

  containsGameWithDisplayName(String string){;

    bool containsGame = false;

    _games.forEach((p) {
      if(p.displayName == string) containsGame = true;
    });

    return containsGame;

  }


  printAll(){
    _games.forEach((p) => print(p.id));

  }

  List<String> listAllNames(){

    List<String> names = new List();

    _games.forEach((p) => names.add(p.displayName));

    return names;

  }

  List<String> listAllGames(){

    List<String> names = new List();

    _games.forEach((p) => names.add(p.id));

    return names;

  }


  Game get first => _games.first;
  Game get last => _games.last;







}

