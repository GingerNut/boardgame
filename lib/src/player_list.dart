


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
  remove(Player player) =>  _players.remove(player);
  bool get isEmpty => _players.isEmpty;
  int get length  => _players.length;

  clear() => _players.clear();
  forEach(Function(Player player) function) => _players.forEach(function);

  Player getPlayerWithId(String id){

    Player player;

    _players.forEach((p) {
      if(p.id == id) player = p;
    });

    return player;

  }

  containsPlayerWithDisplayName(String string){;

    bool containsPlayer = false;

    _players.forEach((p) {
      if(p.displayName == string) containsPlayer = true;
    });

    return containsPlayer;

  }

  printAll(){
    _players.forEach((p) => print(p.id));

  }

  List<String> listAllNames(){

    List<String> names = new List();

    _players.forEach((p) => names.add(p.displayName));

    return names;

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