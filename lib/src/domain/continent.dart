import 'package:ntravel/src/domain/country.dart';


/// Responsible for representing a continent.
class Continent {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final String name;
  List<Country> _countries = [];


  //---------------------------------------------------------------------------
  //		Constructors
  //---------------------------------------------------------------------------
  Continent({
    required this.name
  });


  //---------------------------------------------------------------------------
  //		Getters & Setters
  //---------------------------------------------------------------------------
  void setCountries(List<Country> countries) {
    _countries = countries;
  }

  List<Country> get countries => _countries;
}
