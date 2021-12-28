import 'package:ntravel/src/domain/country.dart';

class Continent {

  final String name;
  List<Country> _countries = [];

  Continent({
    required this.name
  });

  void setCountries(List<Country> countries) {
    _countries = countries;
  }

  List<Country> get countries => _countries;
}
