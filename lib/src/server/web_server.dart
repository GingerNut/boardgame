
import 'dart:io';

//  C:\Users\Stephen\growing_games\boardgame\lib\src\server

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





