


import 'dart:convert';


import 'dart:io';

import 'package:boardgame/src/interface/interface.dart';
import 'package:boardgame/src/settings.dart';

import 'test_game.dart';
import 'test_server.dart';

class TestInterface extends Interface{

  HttpServer httpServer;
  Uri url;

  initialise() async{
    httpServer = await HttpServer.bind('localhost', 0);
    url = await Uri.parse("http://${httpServer.address.host}:4040");
  }

  tidyUp() async{
    await httpServer.close(force: true);
    server = null;
    url = null;

  }

  createNewGame(Settings settings) => TestGame(settings, server);

  getGameServer() => TestServer();



  Future<String> getRequest([String details])async{

    String reply;

    var request = await HttpClient().getUrl(url);

    // sends the request
    var response = await request.close();

    // transforms and prints the response
    await for (var contents in response.transform(Utf8Decoder())) {
      reply = contents;
    }

    return reply;
  }

  Future<String> postRequest([String details])async{

    String reply;

    var request = await HttpClient().postUrl(url);
    request.write(details);

    // sends the request
    var response = await request.close();

    // transforms and prints the response
    await for (var contents in response.transform(Utf8Decoder())) {
      reply = contents;
    }

    return reply;
  }



}