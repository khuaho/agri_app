import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../global/data/models/app_settings/app_settings.dart';
import '../../global/data/repositories/app_settings_repository.dart';

final appSettingProvider =
    StateNotifierProvider<AppSettingsProvider, AppSettings>(
  (ref) => AppSettingsProvider(
    ref.watch(appSettingsRepositoryProvider),
  ),
);

class AppSettingsProvider extends StateNotifier<AppSettings> {
  AppSettingsProvider(this._hiveService)
      : super(
          _hiveService.getAppSettings().fold(
                (l) => const AppSettings(),
                (r) => r,
              ),
        );

  final AppSettingsRepository _hiveService;

  // ThemeData get themeData => state.theme.toThemeData();

  // Locale get localeData => state.locale.toLocale();

  // void changeLocale(AppLocale locale) async {
  //   await _hiveService.save(state.copyWith(locale: locale)).then(
  //         (either) => either.fold(
  //           (l) => null,
  //           (r) => state = r,
  //         ),
  //       );
  //   I18n.locale = locale.toLocale();
  // }

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
