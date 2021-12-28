import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';
import 'package:ntravel/src/services/service.dart';

class ContinentService extends Service {

  static final ContinentService _instance = ContinentService._internal();

  factory ContinentService() {
    return _instance;
  }

  ContinentService._internal();

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
