import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


/// Responsible for getting data from a database.
abstract class Service {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  DatabaseReference? _dbRef;


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @protected
  Future<bool> startService() async {
    _dbRef = await _initializeDatabase();

    return (_dbRef != null);
  }

  Future<DatabaseReference?> _initializeDatabase() async {
    await Firebase.initializeApp();

    return FirebaseDatabase.instance.ref();
  }


  //---------------------------------------------------------------------------
  //		Getters
  //---------------------------------------------------------------------------
  @protected
  DatabaseReference? get dbRef => _dbRef;
}
