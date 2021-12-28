import 'package:flutter/material.dart';
import 'package:ntravel/src/screens/city/city_screen.dart';
import 'package:ntravel/src/screens/continent_screen.dart';
import 'package:ntravel/src/screens/favorites_screen.dart';
import 'package:ntravel/src/screens/home/home_screen.dart';
import 'package:ntravel/src/screens/cities_screen.dart';
import 'package:ntravel/src/screens/preload/preload_screen.dart';
import 'package:ntravel/src/screens/search/search_screen.dart';


/// Responsible for configuring application routes.
class RoutesConfig {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  static final RoutesConfig _instance = RoutesConfig._internal();
  late Map<String, Widget Function(BuildContext)> _routes;
  late String _initialRoute;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  RoutesConfig._internal() {
    _initialRoute = '/preload';
    _routes = const <String, WidgetBuilder>{};

    _initializeRoutes();
  }


  //---------------------------------------------------------------------------
  //		Factory
  //---------------------------------------------------------------------------
  factory RoutesConfig() {
    
    return _instance;
  }


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  void _initializeRoutes() {
    _routes = {
      '/preload': (context) => const PreloadScreen(),
      '/home': (context) => HomeScreen(),
      '/search': (context) => const SearchScreen(),
      '/continent': (context) => ContinentScreen(),
      '/favorites': (context) => FavoritesScreen(),
      '/list_city': (context) => CitiesScreen(),
      '/city': (context) => const CityScreen(),
    };
  }


  //---------------------------------------------------------------------------
  //		Getters
  //---------------------------------------------------------------------------
  Map<String, Widget Function(BuildContext)> get routes => _routes;

  String get initialRoute => _initialRoute;
}
