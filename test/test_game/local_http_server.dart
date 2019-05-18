
import 'dart:io';

import 'test_server.dart';


// dart package:boardgame/bin/local_http_server.dart

// dart C:\Users\Stephen\growing_games\boardgame\lib\bin\local_http_server.dart

Future main() async {

  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

 TestServer searchServer = TestServer();

  await for (HttpRequest request in server) {

    await searchServer.handleRequest(request);

  }
}

