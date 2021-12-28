import 'package:flutter/material.dart';
import 'package:ntravel/src/screens/city_screen.dart';
import 'package:ntravel/src/screens/continent_screen.dart';
import 'package:ntravel/src/screens/favorites_screen.dart';
import 'package:ntravel/src/screens/home/home_screen.dart';
import 'package:ntravel/src/screens/cities_screen.dart';
import 'package:ntravel/src/screens/preload/preload_screen.dart';
import 'package:ntravel/src/screens/search/search_screen.dart';

class RoutesConfig {

  static final RoutesConfig _instance = RoutesConfig._internal();
  
  Map<String, Widget Function(BuildContext)> _routes = const <String, WidgetBuilder>{};
  String _initialRoute = '';

  factory RoutesConfig() {
    
    return _instance;
  }

  RoutesConfig._internal() {
    _initialRoute = '/preload';

    _initializeRoutes();
  }

  void _initializeRoutes() {
    _routes = {
      '/preload': (context) => PreloadScreen(),
      '/home': (context) => HomeScreen(),
      '/search': (context) => SearchScreen(),
      '/continent': (context) => ContinentScreen(),
      '/favorites': (context) => FavoritesScreen(),
      '/list_city': (context) => CitiesScreen(),
      '/city': (context) => CityScreen(),
    };
  }

  Map<String, Widget Function(BuildContext)> get routes => _routes;
  String get initialRoute => _initialRoute;
}
