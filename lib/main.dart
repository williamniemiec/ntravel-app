import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ntravel/src/config/http_config.dart';
import 'package:ntravel/src/config/provider_config.dart';
import 'package:ntravel/src/config/routes_config.dart';
import 'package:ntravel/src/config/locales_config.dart';
import 'package:provider/provider.dart';

void main() {
  final routesConfig = RoutesConfig();
  final providerConfig = ProviderConfig();
  final localesConfig = LocalesConfig(null);

  HttpOverrides.global = HttpConfig();

  runApp(
    MultiProvider(
      providers: providerConfig.providers,
      child: MyApp(
        routesConfig: routesConfig,
        localesConfig: localesConfig
      )
    )
  );
}

class MyApp extends StatelessWidget {
  
  final dynamic routesConfig;
  final dynamic localesConfig;

  const MyApp({
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
