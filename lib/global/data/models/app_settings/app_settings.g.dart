// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettings _$$_AppSettingsFromJson(Map<String, dynamic> json) =>
    _$_AppSettings(
      $enumDecodeNullable(_$AppLocaleEnumMap, json['locale']) ?? AppLocale.vi,
      $enumDecodeNullable(_$AppThemeEnumMap, json['theme']) ?? AppTheme.auto,
      $enumDecodeNullable(_$LanguageEnumMap, json['weatherLanguage']) ??
          Language.VIETNAMESE,
      json['isFirstLaunch'] as bool? ?? true,
      (json['lat'] as num?)?.toDouble() ?? 0,
      (json['lon'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_AppSettingsToJson(_$_AppSettings instance) =>
    <String, dynamic>{
      'locale': _$AppLocaleEnumMap[instance.locale]!,
      'theme': _$AppThemeEnumMap[instance.theme]!,
      'weatherLanguage': _$LanguageEnumMap[instance.weatherLanguage]!,
      'isFirstLaunch': instance.isFirstLaunch,
      'lat': instance.lat,
      'lon': instance.lon,
    };

const _$AppLocaleEnumMap = {
  AppLocale.en: 'en',
  AppLocale.vi: 'vi',
};

const _$AppThemeEnumMap = {
  AppTheme.auto: 'auto',
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};

const _$LanguageEnumMap = {
  Language.AFRIKAANS: 'AFRIKAANS',
  Language.ALBANIAN: 'ALBANIAN',
  Language.ARABIC: 'ARABIC',
  Language.AZERBAIJANI: 'AZERBAIJANI',
  Language.BULGARIAN: 'BULGARIAN',
  Language.CATALAN: 'CATALAN',
  Language.CZECH: 'CZECH',
  Language.DANISH: 'DANISH',
  Language.GERMAN: 'GERMAN',
  Language.GREEK: 'GREEK',
  Language.ENGLISH: 'ENGLISH',
  Language.BASQUE: 'BASQUE',
  Language.PERSIAN: 'PERSIAN',
  Language.FARSI: 'FARSI',
  Language.FINNISH: 'FINNISH',
  Language.FRENCH: 'FRENCH',
  Language.GALICIAN: 'GALICIAN',
  Language.HEBREW: 'HEBREW',
  Language.HINDI: 'HINDI',
  Language.CROATIAN: 'CROATIAN',
  Language.HUNGARIAN: 'HUNGARIAN',
  Language.INDONESIAN: 'INDONESIAN',
  Language.ITALIAN: 'ITALIAN',
  Language.JAPANESE: 'JAPANESE',
  Language.KOREAN: 'KOREAN',
  Language.LATVIAN: 'LATVIAN',
  Language.LITHUANIAN: 'LITHUANIAN',
  Language.MACEDONIAN: 'MACEDONIAN',
  Language.NORWEGIAN: 'NORWEGIAN',
  Language.DUTCH: 'DUTCH',
  Language.POLISH: 'POLISH',
  Language.PORTUGUESE: 'PORTUGUESE',
  Language.PORTUGUESE_BRAZIL: 'PORTUGUESE_BRAZIL',
  Language.ROMANIAN: 'ROMANIAN',
  Language.RUSSIAN: 'RUSSIAN',
  Language.SWEDISH: 'SWEDISH',
  Language.SLOVAK: 'SLOVAK',
  Language.SLOVENIAN: 'SLOVENIAN',
  Language.SPANISH: 'SPANISH',
  Language.SERBIAN: 'SERBIAN',
  Language.THAI: 'THAI',
  Language.TURKISH: 'TURKISH',
  Language.UKRAINIAN: 'UKRAINIAN',
  Language.VIETNAMESE: 'VIETNAMESE',
  Language.CHINESE_SIMPLIFIED: 'CHINESE_SIMPLIFIED',
  Language.CHINESE_TRADITIONAL: 'CHINESE_TRADITIONAL',
  Language.ZULU: 'ZULU',
};
