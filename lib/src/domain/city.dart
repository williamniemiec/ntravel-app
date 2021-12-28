import 'package:ntravel/src/domain/place.dart';

class City {
  
  final String name;
  final String description;
  final double review;
  List<Place> _places = [];

  City({
    required this.name,
    required this.description,
    required this.review
  });

  void setPlaces(List<Place> places) {
    _places = places;
  }

  List<Place> get places => _places;
}