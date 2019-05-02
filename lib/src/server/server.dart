

import 'dart:async';


abstract class Server{

  Stream<String> messagesIn;
  StreamController<String> messagesOut;

  listeningPort(Server server, Stream otherMessagesIn){
    messagesIn = otherMessagesIn;
    messagesIn.listen((m) => message(m));

    if(messagesOut == null){
      messagesOut = StreamController<String>();
      server.listeningPort(this, messagesOut.stream);
    }

  }

  handShakeServer(Server server){
    messagesOut = StreamController<String>();

    server.listeningPort(this, messagesOut.stream);

  }


  message(String s);







}