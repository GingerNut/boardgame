


import 'package:boardgame/src/interface/user.dart';



class UserList{

  List<User> _users;

  UserList([int size]){

    if(size != null) _users = List(size);
    else _users = List();

  }

  operator [](int i) => _users[i];
  operator []=(int i, User value) => _users[i] = value;

  add(User player) => _users.add(player);

  int get length  => _users.length;

  User getUserWithId(String id){

    User player;

    _users.forEach((p) {
      if(p.id == id) player = p;
    });

    return player;

  }


  printAll(){
    _users.forEach((u) => print(u.id));

  }

  Future<String> getListOfUsers() async{
    String response = '';

    _users.forEach((u) {
      response += u.id;
      response += '\n';

    } );

    return response;
  }



}