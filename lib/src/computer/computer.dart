



import 'package:boardgame/src/position.dart';

abstract class Computer{

  Position position;

  Future<String> initialise(String string);

  update(String message);

  Future<String> suggestMove(String message);

  pause();

  kill();
}







