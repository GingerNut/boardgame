
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





}
