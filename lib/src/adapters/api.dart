import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

class Api {

  static final Api _instance = Api._internal();
  DatabaseReference? _dbRef;

  factory Api() {
    return _instance;
  }

  Api._internal();

  dynamic requestData() async {
    _dbRef = await _initializeDatabase();

    if (_dbRef == null) {
      return null;
    }
    
    DataSnapshot snapshot = await _dbRef!.get();
    var responseBody = jsonEncode(snapshot.value);
    
    return jsonDecode(responseBody);
  }

  Future<DatabaseReference?> _initializeDatabase() async {
    await Firebase.initializeApp();

    return FirebaseDatabase.instance.ref();
  }

  
}

