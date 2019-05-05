


import 'dart:math';

import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';



class PlayerDatabase{

  // mock database until proper db implemented

  PlayerList _playerList = PlayerList();

  bool checkNameUnique(String name) => _playerList.getPlayerWithId(name) == null;

  bool addPlayer(String name){
    if(checkNameUnique(name)== false) return false;

    _playerList.add(Player()..id = name);

    return true;
  }

  printAll(){
    _playerList.printAll();
  }

  Future<String> getAllUsers() => _playerList.getListOfUsers();

  String get randomName {

    String _randomString(int length) {
      var rand = new Random();
      var codeUnits = new List.generate(
          length,
              (index){
            return rand.nextInt(26)+97;
          }
      );

      return new String.fromCharCodes(codeUnits);
    }

    String _randomName = _randomString(8);

    while(_playerList.getPlayerWithId(_randomName)!=null){
      _randomName = _randomString(8);
    }

    return _randomName;

}

Future<String> clearPlayers() async{
    _playerList.clear();

    return 'OK';
}










}