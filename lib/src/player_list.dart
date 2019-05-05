


import 'package:boardgame/src/player.dart';


class PlayerList{

  List<Player> _players;

  PlayerList([int size]){

    if(size != null) _players = List(size);
    else _players = List();

  }

  operator [](int i) => _players[i];
  operator []=(int i, Player value) => _players[i] = value;

  add(Player player) => _players.add(player);

  int get length  => _players.length;

  clear() => _players.clear();

  Player getPlayerWithId(String id){

    Player player;

    _players.forEach((p) {
      if(p.id == id) player = p;
    });

    return player;

  }

  printAll(){
    _players.forEach((p) => print(p.id));

  }

  Future<String> getListOfUsers() async{
    String response = '';

    _players.forEach((p) {
      response += p.id;
      response += '\n';

    } );

    return response;
  }




}