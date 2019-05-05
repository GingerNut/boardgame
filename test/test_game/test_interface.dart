


import 'dart:convert';


import 'dart:io';

import 'package:boardgame/src/interface/interface.dart';


class TestInterface extends Interface{

  HttpServer httpServer;
  Uri url;
  int port = 4040;

  connectToServer() async {
    httpServer = await HttpServer.bind('localhost', 0);
    url = await Uri.parse("http://${httpServer.address.host}:$port");
  }

  updateLogin(){



  }

  getUserList(){



  }

  tidyUp() async{
    await httpServer.close(force: true);
    httpServer = null;
    url = null;

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





}