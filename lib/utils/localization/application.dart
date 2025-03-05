import 'dart:ui';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }
  Application._internal();

  static List<Locale> supportedLocale = [
    const Locale("en", ""),
    const Locale("gu", ""),
    const Locale("el", ""),
    const Locale("th", ""),
    const Locale("es", ""),
    const Locale("hi", ""),
  ];

  final List<String> supportedLanguagesCodes = [
    "en",
    "gu",
    "el",
    "th",
    "es",
    "hi",
  ];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, " "));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged = (Locale locale) {};
}

Application application = Application();

typedef LocaleChangeCallback = void Function(Locale locale);

class LangCode {
  static const String english = 'en';
}
