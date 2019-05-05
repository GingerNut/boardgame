


import 'package:boardgame/src/interface/user.dart';
import 'package:boardgame/src/interface/user_list.dart';


class UserDatabase{

  // mock database until proper db implemented

  UserList _userList = UserList();

  bool checkNameUnique(String name) => _userList.getUserWithId(name) == null;

  bool addPlayer(String name){
    if(checkNameUnique(name)== false) return false;

    _userList.add(User()..id = name);

    return true;
  }

  printAll(){
    _userList.printAll();
  }








}