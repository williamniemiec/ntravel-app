import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/domain/continent.dart';
import 'package:ntravel/src/domain/country.dart';
import 'package:ntravel/src/domain/place.dart';


/// Responsible for providing continent data.
class ContinentService {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  static final ContinentService _instance = ContinentService._internal();
  DatabaseReference? _dbRef;


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
  Future<List<Continent>> getContinents() async {
    bool success = await _startService();

    if (!success) {
      return [];
    }
    
    DataSnapshot snapshot = await _dbRef!.get();
    String responseBody = jsonEncode(snapshot.value);
    
    return parseContinents(responseBody);
  }

  Future<bool> _startService() async {
    _dbRef = await _initializeDatabase();

    return (_dbRef != null);
  }

  Future<DatabaseReference?> _initializeDatabase() async {
    await Firebase.initializeApp();

    return FirebaseDatabase.instance.ref();
  }

  List<Continent> parseContinents(String json) {
    List<Continent> continents = [];
    dynamic rawContinents = jsonDecode(json);

    for (var rawContinent in rawContinents) {
      Continent continent = Continent(
        name: rawContinent['name']
      );

      List<Country> countries = [];
      for (var rawCountry in rawContinent['countries']) {
        Country country = Country(
          name: rawCountry['name']
        );

        List<City> cities = [];
        for (var rawCity in rawCountry['cities']) {
          City city = City(
            name: rawCity['name'], 
            description: rawCity['description'], 
            review: double.parse(rawCity['review'].toString())
          );
          
          List<Place> places = [];
          for (var rawPlace in rawCity['places']) {
            places.add(
              Place(
                img: rawPlace['img'], 
                name: rawPlace['name']
            ));
          }

          city.setPlaces(places);
          cities.add(city);
        }

        country.setCities(cities);
        countries.add(country);
      }

      continent.setCountries(countries);
      continents.add(continent);
    }

    return continents;
  }
}
