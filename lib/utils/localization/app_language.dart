import 'package:flutter/material.dart';
import 'package:happy_grocers/utils/local_storage/local_storage_keys.dart';
import 'package:happy_grocers/utils/local_storage/storage_manager.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;

  fetchLocale() {
    String? language =
        StorageManager.getInstance().getString(LocalStorageKeys.prefLanguage);
    if (language.isEmpty) {
      _appLocale = const Locale('en');
      return Null;
    }
    _appLocale = Locale(language);
    return Null;
  }

  changeLanguage(Locale type) {
    if (_appLocale == type) {
      return;
    }
    _appLocale = type;
    StorageManager.getInstance()
        .setString(LocalStorageKeys.prefLanguage, type.languageCode);
    // if (type == const Locale("en")) {
    //   _appLocale =  Locale(type.languageCode);
    //   StorageManager.getInstance()
    //       .setString(LocalStorageKeys.prefLanguage, type.languageCode);
    // } else {
    //   _appLocale = const Locale("en");
    //   StorageManager.getInstance()
    //       .setString(LocalStorageKeys.prefLanguage, "en");
    // }
    notifyListeners();
  }
}
