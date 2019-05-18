

import 'package:boardgame/src/command/new_game.dart';
import 'package:boardgame/src/game.dart';
import 'package:boardgame/src/position.dart';
import 'package:boardgame/src/server/server.dart';

import 'package:boardgame/src/settings.dart';

import 'test_position.dart';


// count up and multiples of 3 require Fie, of 5 require Fo and both Fum. Mistake = out

class TestGame extends Game{

  TestGame(NewGame settings) : super(settings);

  String get string => null;

  getPosition() => TestPosition(this);




}