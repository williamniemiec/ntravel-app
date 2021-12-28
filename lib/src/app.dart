import 'package:flutter/material.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:ntravel/src/config/routes_config.dart';

class App extends StatelessWidget {
  
  final RoutesConfig routesConfig;
  final LocalesConfig localesConfig;

  const App({
    required this.routesConfig,
    required this.localesConfig,
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'nTravel',
      supportedLocales: localesConfig.supportedLanguages,
      localizationsDelegates: localesConfig.localizationsDelegates,
      localeResolutionCallback: localesConfig.localeResolutionCallback,
      routes: routesConfig.routes,
      initialRoute: routesConfig.initialRoute
    );
  }
}
