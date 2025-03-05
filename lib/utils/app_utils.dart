import 'package:flutter/material.dart';
import 'package:happy_grocers/utils/localization/translations.dart';

class AppUtils {
  static String getLocaleText(BuildContext context, String? text) {
    return Translations.of(context)?.text(text ?? "") ?? '';
  }
}
