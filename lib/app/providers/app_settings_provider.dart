import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../../global/data/models/app_event/app_event.dart';
import '../../global/data/models/app_settings/app_settings.dart';
import '../../global/data/repositories/app_settings_repository.dart';
import '../../global/extensions/app_locale_ext.dart';
import '../../global/gen/strings.g.dart';
import '../../global/utils/app_mixin.dart';

final appSettingProvider =
    StateNotifierProvider<AppSettingsProvider, AppSettings>(
  (ref) => AppSettingsProvider(
    ref.watch(appSettingsRepositoryProvider),
  ),
);

class AppSettingsProvider extends StateNotifier<AppSettings> with AppMixin {
  AppSettingsProvider(this._hiveService)
      : super(
          _hiveService.getAppSettings().fold(
                (l) => const AppSettings(),
                (r) => r,
              ),
        );

  final AppSettingsRepository _hiveService;

  ThemeData get themeData => state.theme.toThemeData();

  Locale get localeData => state.locale.toLocale();

  Language get weatherLanguage => state.weatherLanguage;

  void changeLocale(AppLocale locale) async {
    await _hiveService
        .save(
          state.copyWith(
            locale: locale,
            weatherLanguage:
                locale == AppLocale.en ? Language.ENGLISH : Language.VIETNAMESE,
          ),
        )
        .then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
    LocaleSettings.setLocale(locale, listenToDeviceLocale: true);
    eventBus.fire(const ChangeLanguageEvent());
  }

  AppSettings getAppSettings() {
    return _hiveService.getAppSettings().fold(
          (l) => const AppSettings(),
          (r) => r,
        );
  }

  Future<void> saveCurrentPosition(
    Position position,
  ) async {
    final appSettings = getAppSettings();
    await _hiveService.saveCurrentPosition(appSettings, position).then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }

  void reset() async {
    await _hiveService.reset().then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }

  Future update(AppSettings Function(AppSettings state) newState) async {
    return _hiveService.save(newState(state)).then(
          (either) => either.fold(
            (l) => null,
            (r) {
              state = r;
            },
          ),
        );
  }
}
