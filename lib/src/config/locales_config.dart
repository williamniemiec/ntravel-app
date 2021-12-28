import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


/// Responsible for configuring application languages.
class LocalesConfig {

  //---------------------------------------------------------------------------
  //		Attributes
  //---------------------------------------------------------------------------
  static final LocalesConfig _instance = LocalesConfig._internal();
  static final Iterable<Locale> _supportedLanguages = _getSupportedLanguages();
  static final Iterable<LocalizationsDelegate<dynamic>> _delegates = _getDelegates();
  late Locale currentLocale;
  late Map<String, String> _sentences;


  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  LocalesConfig._internal() {
    currentLocale = _supportedLanguages.first;
  }


  //---------------------------------------------------------------------------
  //		Factory
  //---------------------------------------------------------------------------
  factory LocalesConfig(Locale? locale) {
    if (locale != null) {
      _instance.currentLocale = locale;
    }
    
    return _instance;
  }


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
   static Iterable<Locale>  _getSupportedLanguages() {
    return [
      const Locale('pt', 'BR'),
      const Locale('en', 'US')
    ];
  }

  static Iterable<LocalizationsDelegate<dynamic>> _getDelegates() {
    return [
      const LocalesConfigDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ]; 
  }

  static LocalesConfig? of(BuildContext context) {
    return Localizations.of<LocalesConfig>(context, LocalesConfig);
  }

  Locale localeResolutionCallback(Locale? locale, 
                                  Iterable<Locale>? supportedLocalesConfig) {
    for (Locale supportedLocale in supportedLocalesConfig!) {
      if (isSupported(supportedLocale, locale)) {
        return supportedLocale;
      }
    }

    return supportedLocalesConfig.first;
  }

  bool isSupported(Locale supportedLocale, Locale? locale) {
    return  (supportedLocale.languageCode == locale?.languageCode) 
            || (supportedLocale.countryCode == locale?.countryCode);
  }

  Future<bool> load() async {
    Map<String, dynamic> storedDictionary = await _loadDictionary();

    _parseDictionary(storedDictionary);

    return true;
  }

  Future<Map<String, dynamic>> _loadDictionary() async {
    String storedDictionary = await rootBundle.loadString(
      'lib/locales/${currentLocale.languageCode}.json'
    );
    
    return json.decode(storedDictionary);
  }

  void _parseDictionary(Map<String, dynamic> storedDictionary) {
    _sentences = {};
    
    storedDictionary.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });
  }

  String translate(String key) {
    return _sentences[key] ?? key;
  }


  //---------------------------------------------------------------------------
  //		Getters
  //---------------------------------------------------------------------------
  Iterable<LocalizationsDelegate<dynamic>> get delegates {
    return _delegates;
  }

  Iterable<Locale> get supportedLanguages => _supportedLanguages;
}


class LocalesConfigDelegate extends LocalizationsDelegate<LocalesConfig> {

  //---------------------------------------------------------------------------
  //		Constructor
  //---------------------------------------------------------------------------
  const LocalesConfigDelegate();


  //---------------------------------------------------------------------------
  //		Methods
  //---------------------------------------------------------------------------
  @override
  bool isSupported(Locale locale) {
    return getSupportedLanguages().contains(locale.languageCode);
  }

  List<String> getSupportedLanguages() {
    return [
      'pt', 'en'
    ];
  }

  @override
  Future<LocalesConfig> load(Locale locale) async {
    LocalesConfig localizations = LocalesConfig(locale);
    
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(LocalesConfigDelegate old) => false;
}
