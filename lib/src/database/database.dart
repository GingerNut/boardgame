


import 'package:boardgame/src/database/record.dart';
import 'package:boardgame/src/response/response.dart';
import 'package:boardgame/src/response/success.dart';

class Database{

  List<Record> _records = new List();

  Future<Response> addRecord(Record record) async{

    _records.add(record);

    return Success();
  }

  Future<Record> getRecordWithId(String string) async{

    Record record;

    _records.forEach((r) {
      if(r.id == string) record = r;
    });

    return record;
  }

  Future<Record> getRecordWithDisplayName(String string)async{
    Record record;

    _records.forEach((r) {
      if(r.displayName == string) record = r;
    });

    return record;

  }

  Future<Record> getRecordWithEmail(String string)async{
    Record record;

    _records.forEach((r) {
      if(r.email == string) record = r;
    });

    return record;

  }


}
