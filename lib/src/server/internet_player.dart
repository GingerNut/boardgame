



import 'package:boardgame/src/interface/player.dart';
import 'package:boardgame/src/server/channel.dart';


class InternetPlayer extends Player{

  final Channel channel;

  InternetPlayer(this.channel);


}