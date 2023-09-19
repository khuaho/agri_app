import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../gen/strings.g.dart';

extension AppLocaleExt on AppLocale {
  Locale toLocale() {
    switch (this) {
      case AppLocale.en:
        return const Locale('en', 'US');
      case AppLocale.vi:
        return const Locale('vi', 'VN');
      default:
        if (kIsWeb) return const Locale('vi', 'VN');
        final codes = Platform.localeName;
        return Locale(codes.split('_')[0]);
    }
  }

  String getLabel(BuildContext context) {
    final transl = Translations.of(context);
    return this == AppLocale.en
        ? transl.settings.language.english
        : transl.settings.language.vietnamese;
  }
}
