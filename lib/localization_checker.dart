import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker {
  static changeLanguage(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('ar', 'AE'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }

  static bool isArabic(BuildContext context) {
    return EasyLocalization.of(context)!.currentLocale ==
        const Locale('ar', 'AE');
  }

  static bool isEnglish(BuildContext context) {
    return EasyLocalization.of(context)!.currentLocale ==
        const Locale('en', 'US');
  }
}
