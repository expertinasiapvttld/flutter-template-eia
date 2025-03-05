import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:happy_grocers/di/dependency_injection.dart';
import 'package:happy_grocers/grocery_app.dart';
import 'package:happy_grocers/utils/local_storage/storage_manager.dart';
import 'package:happy_grocers/utils/localization/app_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  if (!kDebugMode) {
    await dotenv.load(fileName: ".env");
  } else {
    await dotenv.load(fileName: ".env.dev");
  }
  startApp();
}

void startApp() async {
  await _initialiseApp();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(GroceryApp(appLanguage));
}

Future _initialiseApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await Future.wait([_initSharedPreferences()]);
}

Future _initSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  StorageManager.init(prefs);
}
