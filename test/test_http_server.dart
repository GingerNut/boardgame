
import 'dart:io';

import 'package:boardgame/src/server/http_server.dart';
import 'package:boardgame/src/server/server.dart';

// to set up the server cd to the following at the cmd prompt
//
//    cd C:\Users\Stephen\growing_games\boardgame\test

//    dart test_http_server.dart

Future main() async {

  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  HttpGameServer searchServer = HttpGameServer();

  await for (HttpRequest request in server) {
    searchServer.handleResponse(request);
  }
}

