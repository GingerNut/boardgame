

import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/server/server.dart';

import 'package:boardgame/src/settings.dart';

import 'test_position.dart';


// count up and multiples of 3 require Fie, of 5 require Fo and both Fum. Mistake = out

class TestGame extends Game{

  TestGame(Settings settings, Server server) : super(settings, server);

  String get string => null;

  getPosition(Position parent) => TestPosition(this, position);




}