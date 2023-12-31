// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/weather.dart';

import '../../../enum/app_theme.dart';
import '../../../gen/strings.g.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings([
    @Default(AppLocale.vi) AppLocale locale,
    @Default(AppTheme.auto) AppTheme theme,
    @Default(Language.VIETNAMESE) Language weatherLanguage,
    @Default(true) bool isFirstLaunch,
    @Default(0) double lat,
    @Default(0) double lon,
  ]) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
