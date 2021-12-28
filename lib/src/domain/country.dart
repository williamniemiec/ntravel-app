import 'package:ntravel/src/domain/city.dart';


/// Responsible for representing a country.
class Country {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final String name;
  List<City> _cities = [];


  //---------------------------------------------------------------------------
  //		Constructors
  //---------------------------------------------------------------------------
  Country({
    required this.name
  });


  //---------------------------------------------------------------------------
  //		Getters & Setters
  //---------------------------------------------------------------------------
  void setCities(List<City> cities) {
    _cities = cities;
  }

  List<City> get cities => _cities;
}