
import 'package:boardgame/src/player.dart';
import 'package:boardgame/src/player_list.dart';
import 'package:boardgame/src/server/server.dart';


class Chatter{

  final Server server;
  final PlayerList players;
  List<ChatElement> chatElements = List();

  Chatter(this.server, this.players);


  chatReceived(String string){

    List<String> elements = string.split('\n');

    Player from = players.getPlayerWithId(elements[0]);
    Player to = players.getPlayerWithId(elements[1]);

    chatElements.add(ChatElement(from, to, elements[2]));

  }


}


class ChatElement{

  final Player from;
  final Player to;
  final String text;

  ChatElement(this.from, this.to, this.text);

}