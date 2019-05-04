
import 'dart:io';

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

    await for (HttpRequest request in server) {
      request.response
        ..write('Hello, world!')
        ..close();
    }
  }





