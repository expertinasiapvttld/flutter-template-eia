import 'dart:async';
import 'package:flutter/material.dart';
import 'package:happy_grocers/utils/localization/translations.dart';

import 'application.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<Translations> {
  final Locale? newLocale;

  const AppTranslationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<Translations> load(Locale locale) {
    return Translations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) {
    return true;
  }
}
