import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

abstract class Service {

  DatabaseReference? _dbRef;

  Future<DatabaseReference?> _initializeDatabase() async {
    await Firebase.initializeApp();

    return FirebaseDatabase.instance.ref();
  }

  @protected
  Future<bool> startService() async {
    _dbRef = await _initializeDatabase();

    return (_dbRef != null);
  }

  @protected
  DatabaseReference? get dbRef => _dbRef;
}
