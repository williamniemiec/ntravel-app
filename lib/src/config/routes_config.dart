import 'package:flutter/material.dart';
import 'package:ntravel/src/pages/city.dart';
import 'package:ntravel/src/pages/continent.dart';
import 'package:ntravel/src/pages/favorites.dart';
import 'package:ntravel/src/pages/home.dart';
import 'package:ntravel/src/pages/list_city.dart';
import 'package:ntravel/src/pages/preload.dart';
import 'package:ntravel/src/pages/search.dart';

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
      '/preload': (context) => PreloadPage(),
      '/home': (context) => HomePage(),
      '/search': (context) => SearchPage(),
      '/continent': (context) => ContinentPage(),
      '/favorites': (context) => FavoritesPage(),
      '/list_city': (context) => ListCityPage(),
      '/city': (context) => CityPage(),
    };
  }

  Map<String, Widget Function(BuildContext)> get routes => _routes;
  String get initialRoute => _initialRoute;
}
