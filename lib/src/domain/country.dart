import 'package:ntravel/src/domain/city.dart';

class Country {

  final String name;
  List<City> _cities = [];

  Country({
    required this.name
  });

  void setCities(List<City> cities) {
    _cities = cities;
  }

  List<City> get cities => _cities;
}