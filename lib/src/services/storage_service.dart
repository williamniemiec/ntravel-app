import 'package:ntravel/src/domain/city.dart';
import 'package:ntravel/src/domain/continent.dart';
import 'package:ntravel/src/domain/country.dart';
import 'package:ntravel/src/models/app_data.dart';


/// Responsible for handling storage data.
class StorageService {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final AppData _appdata;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  StorageService(AppData appdata) : _appdata = appdata;


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  List<City> getFavorites() {
    return _appdata.getFavorites();
  }

  bool isCityFavorited(City city) {
    return _appdata.isFavorited(city.name);
  }

  Continent getContinentByIndex(int index) {
    return _appdata.continents[index];
  }

  List<City> getCitiesFromContinent(Continent continent) {
    List<City> cities = [];

    for (Country country in continent.countries) {
      cities.addAll(country.cities);
    }
    
    return cities;
  }

  bool favoriteCityWithName(String cityName) {
    return _appdata.favorite(cityName);
  }

  int getTotalContinents() {
    return _appdata.continents.length;
  }

  void setContinents(List<Continent> continents) {
    _appdata.continents = continents;
  }
}
