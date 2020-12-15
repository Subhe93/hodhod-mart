import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Applocalizations {
  final Locale locale;

  Applocalizations(this.locale);

  static Applocalizations of(BuildContext context) {
    return Localizations.of<Applocalizations>(context, Applocalizations);
  }

  static LocalizationsDelegate<Applocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;
  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<Applocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<Applocalizations> load(Locale locale) async {
    Applocalizations localization = new Applocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Applocalizations> old) {
    return false;
  }
}
