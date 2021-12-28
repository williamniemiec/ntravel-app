import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:ntravel/src/services/service.dart';


/// Responsible for providing continent data.
class ContinentService extends Service {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  static final ContinentService _instance = ContinentService._internal();


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  ContinentService._internal();


  //---------------------------------------------------------------------------
  //		Factory
  //---------------------------------------------------------------------------
  factory ContinentService() {
    return _instance;
  }


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  dynamic getContinents() async {
    bool success = await startService();

    if (!success) {
      return null;
    }
    
    DataSnapshot snapshot = await dbRef!.get();
    var responseBody = jsonEncode(snapshot.value);
    
    return jsonDecode(responseBody);
  }
}
