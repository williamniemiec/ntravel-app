import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ntravel/locales/locales.dart';
import 'package:provider/provider.dart';
import 'src/models/app_data.dart';
import 'src/pages/home.dart';
import 'src/pages/search.dart';
import 'src/pages/continent.dart';
import 'src/pages/list_city.dart';
import 'src/pages/city.dart';
import 'src/pages/favorites.dart';
import 'src/pages/preload.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Avoids certificate error
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData()
        )
      ],
      child: MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'nTravel',
      supportedLocales: Locales.supportedLanguages,
      localizationsDelegates: [
        const LocalesDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (Locale? locale, Iterable<Locale>? supportedLocales) {
        for (Locale supportedLocale in supportedLocales!) {
          if (supportedLocale.languageCode == locale?.languageCode || supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },
      routes: {
        '/preload': (context) => PreloadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/favorites': (context) => FavoritesPage(),
        '/list_city': (context) => ListCityPage(),
        '/city': (context) => CityPage(),
      },
      initialRoute: '/preload'
    );
  }
}
