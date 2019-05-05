
import 'dart:io';

import 'package:boardgame/src/server/search_server.dart';

// to set up the server cd to the following at the cmd prompt
//
//  cd C:\Users\Stephen\growing_games\boardgame\test
//
// then type this at command prompt:
//
// dart test_http_server.dart

  Future main() async {

    var server = await HttpServer.bind(
      InternetAddress.loopbackIPv4,
      4040,
    );
    print('Listening on localhost:${server.port}');

    SearchServer searchServer = SearchServer();

    await for (HttpRequest request in server) {
      searchServer.handleResponse(request);
    }
  }

