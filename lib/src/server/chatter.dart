
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';


class Chatter{

  final PlayerList players;

  Chatter(this.players);



  message(String string){

    List<String> elements = string.split('\n');






  }






}

class ChatElement{

  Player from;
  Player to;
  String text;

}