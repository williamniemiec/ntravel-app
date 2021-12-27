import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalesConfig {

  static final LocalesConfig _instance = LocalesConfig._internal();
  Locale currentLocale = _supportedLanguages.first;
  late Map<String, String> _sentences;
  static final Iterable<Locale> _supportedLanguages = [
    const Locale('pt', 'BR'),
    const Locale('en', 'US')
  ];
  static final Iterable<LocalizationsDelegate<dynamic>> _localizationsDelegates = [
    const LocalesConfigDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ]; 

  factory LocalesConfig(Locale? locale) {
    if (locale != null) {
      _instance.currentLocale = locale;
    }
    
    return _instance;
  }

  LocalesConfig._internal() {
    //currentLocale = _supportedLanguages.first;
  }

  static LocalesConfig? of(BuildContext context) {
    return Localizations.of<LocalesConfig>(context, LocalesConfig);
  }

  Locale localeResolutionCallback(Locale? locale, Iterable<Locale>? supportedLocalesConfig) {
    for (Locale supportedLocale in supportedLocalesConfig!) {
      if (supportedLocale.languageCode == locale?.languageCode || supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }

    return supportedLocalesConfig.first;
  }

  Future<bool> load() async {
    String data = await rootBundle.loadString('lib/locales/${this.currentLocale.languageCode}.json');

    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  String translate(String key) {
    return this._sentences[key] ?? key;
  }

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates => _localizationsDelegates;
  Iterable<Locale> get supportedLanguages => _supportedLanguages;
}

class LocalesConfigDelegate extends LocalizationsDelegate<LocalesConfig> {
  const LocalesConfigDelegate();

  @override
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);

  @override
  Future<LocalesConfig> load(Locale locale) async {
    LocalesConfig localizations = new LocalesConfig(locale);
    await localizations.load();

    print("Load ${locale.languageCode}");

    return localizations;
  }

  @override
  bool shouldReload(LocalesConfigDelegate old) => false;
}
