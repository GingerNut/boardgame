


import 'package:boardgame/src/interface/user.dart';



class UserList{

  List<User> _players;

  UserList([int size]){

    if(size != null) _players = List(size);
    else _players = List();

  }

  operator [](int i) => _players[i];
  operator []=(int i, User value) => _players[i] = value;

  add(User player) => _players.add(player);

  int get length  => _players.length;

  User getUserWithId(String id){

    User player;

    _players.forEach((p) {
      if(p.id == id) player = p;
    });

    return player;

  }



}