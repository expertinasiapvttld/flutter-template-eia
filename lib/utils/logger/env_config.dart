import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:happy_grocers/utils/extensions/donenv_ext.dart';

class EnvConfig {
  static bool showLogs = dotenv.getBoolOrDefault('SHOW_LOGS', fallback: false);
}
