import 'package:flutter/material.dart';
import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/domain/continent.dart';
import 'package:ntravel/src/domain/country.dart';


/// Responsible for handling storage data.
class AppData with ChangeNotifier {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  List<Continent> _continents = [];
  List<String> _favorites = [];


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  /// Checks whether a city with name [cityName] has favorited.
  bool isFavorited(String cityName) {
    return _favorites.contains(cityName);
  }

  /// Favorites a city with name [cityName].
  bool favorite(String cityName) {
    if (isFavorited(cityName)) {
      _favorites.remove(cityName);
      
      return false;
    }
    
    _favorites.add(cityName);
    
    return true;
  }

  /// Searches for cities with name [cityName].
  List<City> searchCity(String cityName) {
    if (cityName.isEmpty) {
      return [];
    }

    List<City> searchResult = [];
    String normalizedCityName = cityName.toLowerCase();

    for (Continent continent in _continents) {
      for (Country country in continent.countries) {
        for (City city in country.cities) {
          if (city.name.toLowerCase().contains(normalizedCityName)) {
            searchResult.add(city);
          }
        }
      }
    }

    return searchResult;
  }


  //---------------------------------------------------------------------------
  //		Getters & Setters
  //---------------------------------------------------------------------------
  List<City> getFavorites() {
    List<City> favoritedCities = [];

    for (String favoritedCityName in _favorites) {
      List<City> city = searchCity(favoritedCityName);

      if (city.isNotEmpty) {
        favoritedCities.add(city[0]);
      }
    }

    return favoritedCities;
  }

  set continents(List<Continent> continents) {
    _continents = continents;
    notifyListeners();
  }

  List<Continent> get continents => _continents;
}
