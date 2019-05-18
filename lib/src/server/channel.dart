import 'package:boardgame/src/game_host.dart';

abstract class Channel{
  final GameHost host;

  Channel(this.host);

  sendMessage(String string);

  Future<String> requestResponse(String string){}

}