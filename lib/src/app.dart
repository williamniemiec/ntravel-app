import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/config/routes_config.dart';


/// Application main class.
class App extends StatelessWidget {
  
  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  final RoutesConfig routesConfig;
  final LocalesConfig localesConfig;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const App({
    required this.routesConfig,
    required this.localesConfig,
    Key? key
  }) : super(key: key);
  

  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'nTravel',
      supportedLocales: localesConfig.supportedLanguages,
      localizationsDelegates: localesConfig.delegates,
      localeResolutionCallback: localesConfig.localeResolutionCallback,
      routes: routesConfig.routes,
      initialRoute: routesConfig.initialRoute
    );
  }
}
