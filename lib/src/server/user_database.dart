


import 'package:boardgame/src/interface/user.dart';
import 'package:boardgame/src/interface/user_list.dart';


class UserDatabase{

  // mock database until proper db implemented

  UserList userList;


  bool checkNameUnique(String name) => userList.getUserWithId(name) == null;

  bool addPlayer(String name){
    if(checkNameUnique(name)== false) return false;

    userList.add(User()..id = name);

    return true;
  }







}