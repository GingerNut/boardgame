


import 'dart:convert';
import 'dart:io';

import 'package:boardgame/src/server/server.dart';

class HttpGameServer extends Server{

  HttpServer httpServer;
  Uri url;

  connectLocalhost() async {
    int port = 4040;
    httpServer = await HttpServer.bind('localhost', 0);
    url = await Uri.parse("http://${httpServer.address.host}:$port");
  }

  tidyUp() async{
    await httpServer.close(force: true);
    httpServer = null;
    url = null;

  }

  clearPlayers() => postRequest(Server.clearPlayers);

  handleResponse(HttpRequest request){

    switch(request.method){
      case 'GET': _handleGet(request);
      break;

      case 'POST': _handlePost(request);
      break;

      default:
        request.response
          ..statusCode = HttpStatus.methodNotAllowed
          ..write('Unsupported request: ${request.method}.')
          ..close();
        break;

    }

  }

  _handleGet(HttpRequest request){
    String reply ='Hello world!';

    request.response
      ..write(reply)
      ..close();

  }

  _handlePost(HttpRequest request) async{

    String payload = await request.transform(Utf8Decoder()).join();

    String reply = await _message(payload);

    request.response
      ..write(reply)
      ..close();

  }

  Future<String> _message(String m) async{

    String response = m[0];

    switch(m[0]){

      case Server.apply:
       String name = (m.substring(1) == '?') ? database.randomName : m.substring(1);
       database.addPlayer(name);
       response += name;
        break;

      case Server.getAllUsers:
        response += await database.getAllUsers();
        break;

      case Server.clearPlayers:
        response += await database.clearPlayers();
        break;


    }

    return response;
  }

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





  startGame() {

  }







}