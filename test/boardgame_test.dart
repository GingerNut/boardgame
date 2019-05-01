
import 'package:boardgame/src/settings.dart';
import 'package:test/test.dart';

import 'test_game/test_interface.dart';

void main() {



  group('Set up a new game', () {

    TestInterface ui = TestInterface();

    setUp(() {

    });

    test('Start a game against three computers ', () {
      ui.setUpNewGame();



    });
  });

  group('Settings tests ', () {

    test('Stingify ', (){
      Settings settings = Settings();

      Settings stringed = Settings.fromString(settings.string);

      expect(settings.numberOfPlayers, stringed.numberOfPlayers);


    });


  });






}
