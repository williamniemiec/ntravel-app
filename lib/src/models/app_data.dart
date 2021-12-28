import 'package:flutter/material.dart';
import 'package:ntravel/src/services/continent_service.dart';

class AppData with ChangeNotifier {
  var data;
  var favorites = [];

  List getFavorites() {
    List favoritedCities = [];

    for (String favoritedCityName in favorites) {
      List city = searchCity(favoritedCityName);

      if (!city.isEmpty) {
        favoritedCities.add(city[0]);
      }
    }

    return favoritedCities;
  }

  bool isFavorited(String cityName) {
    return favorites.contains(cityName);
  }

  bool favorite(cityName) {
    if (isFavorited(cityName)) {
      favorites.remove(cityName);
      
      return false;
    }
    
    favorites.add(cityName);
    
    return true;
  }

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    bool success = false;

    var api = ContinentService();
    var requestedData = await api.getContinents();

    if (requestedData != null) {
      setData(requestedData);
      success = true;
    }
    
    return success;
  }

  List searchCity(String text) {
    if (text.isEmpty) {
      return [];
    }

    List searchResult = [];
    String normalizedText = text.toLowerCase();

    for (var continents in data) {
      for (var country in continents['countries']) {
        for (var city in country['cities']) {
          if (city['name'].toLowerCase().contains(normalizedText)) {
            searchResult.add(city);
          }
        }
      }
    }

    return searchResult;
  }
}
