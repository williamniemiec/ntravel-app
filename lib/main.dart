import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ntravel/src/app.dart';
import 'package:ntravel/src/config/http_config.dart';
import 'package:ntravel/src/config/provider_config.dart';
import 'package:ntravel/src/config/routes_config.dart';
import 'package:ntravel/src/config/locales_config.dart';


void main() {
  final routesConfig = RoutesConfig();
  final providerConfig = ProviderConfig();
  final localesConfig = LocalesConfig(null);

  HttpOverrides.global = HttpConfig();

  runApp(
    MultiProvider(
      providers: providerConfig.providers,
      child: App(
        routesConfig: routesConfig,
        localesConfig: localesConfig
      )
    )
  );
}
