import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Locales {

  static final Iterable<Locale> _supportedLanguages = [
    const Locale('pt', 'BR'),
    const Locale('en', 'US')
  ];

  static Iterable<Locale> get supportedLanguages => _supportedLanguages;

  Locales(this.locale);

  final Locale locale;

  static Locales? of(BuildContext context) {
    return Localizations.of<Locales>(context, Locales);
  }

  late Map<String, String> _sentences;

  Future<bool> load() async {
    String data = await rootBundle.loadString('lib/locales/${this.locale.languageCode}.json');

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
}

class LocalesDelegate extends LocalizationsDelegate<Locales> {
  const LocalesDelegate();

  @override
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);

  @override
  Future<Locales> load(Locale locale) async {
    Locales localizations = new Locales(locale);
    await localizations.load();

    print("Load ${locale.languageCode}");

    return localizations;
  }

  @override
  bool shouldReload(LocalesDelegate old) => false;
}
