import 'package:ntravel/src/domain/place.dart';


/// Responsible for representing a city.
class City {
  
  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final String name;
  final String description;
  final double review;
  List<Place> _places = [];


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  City({
    required this.name,
    required this.description,
    required this.review
  });


  //---------------------------------------------------------------------------
  //		Getters & Setters
  //---------------------------------------------------------------------------
  void setPlaces(List<Place> places) {
    _places = places;
  }

  List<Place> get places => _places;
}