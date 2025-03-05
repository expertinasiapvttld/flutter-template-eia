import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  Locale? locale;
  static Map<dynamic, dynamic>? _localisedValues;

  Translations(this.locale);

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static Future<Translations> load(Locale locale) async {
    Translations appTranslations = Translations(locale);
    String jsonContent =
        await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale!.languageCode;

  String text(String key) {
    return _localisedValues![key] ?? "$key not found";
  }
}
