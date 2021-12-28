import 'package:flutter/material.dart';


/// Responsible for handling storage data.
class AppData with ChangeNotifier {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  List data = [];
  List favorites = [];


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  /// Checks whether a city with name [cityName] has favorited.
  bool isFavorited(String cityName) {
    return favorites.contains(cityName);
  }

  /// Favorites a city with name [cityName].
  bool favorite(String cityName) {
    if (isFavorited(cityName)) {
      favorites.remove(cityName);
      
      return false;
    }
    
    favorites.add(cityName);
    
    return true;
  }

  /// Searches for cities with name [cityName].
  List searchCity(String cityName) {
    if (cityName.isEmpty) {
      return [];
    }

    List searchResult = [];
    String normalizedCityName = cityName.toLowerCase();

    for (var continents in data) {
      for (var country in continents['countries']) {
        for (var city in country['cities']) {
          if (city['name'].toLowerCase().contains(normalizedCityName)) {
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
  List getFavorites() {
    List favoritedCities = [];

    for (String favoritedCityName in favorites) {
      List city = searchCity(favoritedCityName);

      if (city.isNotEmpty) {
        favoritedCities.add(city[0]);
      }
    }

    return favoritedCities;
  }

  void setData(newData) {
    data = newData;
    notifyListeners();
  }
}
