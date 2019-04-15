

import 'package:boardgame/src/player.dart';


class Settings{

  static int numberOfPlayers = 4;
  static int playerType = Player.computer;

  static bool fullScreen = true;
  static bool reverseTwoPlayerHuman = false;

  bool timer = true;
  double gameTime = 300.0;
  double moveTime = 12;
}

