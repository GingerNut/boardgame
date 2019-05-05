
import 'package:boardgame/src/interface/user.dart';
import 'package:boardgame/src/interface/user_list.dart';
import 'package:boardgame/src/server/server.dart';



class Chatter{

  final Server server;
  final UserList users;
  List<ChatElement> chatElements = List();

  Chatter(this.server, this.users);


  chatReceived(String string){

    List<String> elements = string.split('\n');

    User from = users.getUserWithId(elements[0]);
    User to = users.getUserWithId(elements[1]);

    chatElements.add(ChatElement(from, to, elements[2]));

  }


}

class ChatPanel{



}


class ChatElement{

  final User from;
  final User to;
  final String text;

  ChatElement(this.from, this.to, this.text);

}