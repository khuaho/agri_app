// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  AppLocale get locale => throw _privateConstructorUsedError;
  AppTheme get theme => throw _privateConstructorUsedError;
  Language get weatherLanguage => throw _privateConstructorUsedError;
  bool get isFirstLaunch => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {AppLocale locale,
      AppTheme theme,
      Language weatherLanguage,
      bool isFirstLaunch,
      double lat,
      double lon});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? theme = null,
    Object? weatherLanguage = null,
    Object? isFirstLaunch = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      weatherLanguage: null == weatherLanguage
          ? _value.weatherLanguage
          : weatherLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      isFirstLaunch: null == isFirstLaunch
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$_AppSettingsCopyWith(
          _$_AppSettings value, $Res Function(_$_AppSettings) then) =
      __$$_AppSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppLocale locale,
      AppTheme theme,
      Language weatherLanguage,
      bool isFirstLaunch,
      double lat,
      double lon});
}

/// @nodoc
class __$$_AppSettingsCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$_AppSettings>
    implements _$$_AppSettingsCopyWith<$Res> {
  __$$_AppSettingsCopyWithImpl(
      _$_AppSettings _value, $Res Function(_$_AppSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? theme = null,
    Object? weatherLanguage = null,
    Object? isFirstLaunch = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$_AppSettings(
      null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as AppLocale,
      null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
      null == weatherLanguage
          ? _value.weatherLanguage
          : weatherLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      null == isFirstLaunch
          ? _value.isFirstLaunch
          : isFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
      null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppSettings implements _AppSettings {
  const _$_AppSettings(
      [this.locale = AppLocale.vi,
      this.theme = AppTheme.auto,
      this.weatherLanguage = Language.VIETNAMESE,
      this.isFirstLaunch = true,
      this.lat = 0,
      this.lon = 0]);

  factory _$_AppSettings.fromJson(Map<String, dynamic> json) =>
      _$$_AppSettingsFromJson(json);

  @override
  @JsonKey()
  final AppLocale locale;
  @override
  @JsonKey()
  final AppTheme theme;
  @override
  @JsonKey()
  final Language weatherLanguage;
  @override
  @JsonKey()
  final bool isFirstLaunch;
  @override
  @JsonKey()
  final double lat;
  @override
  @JsonKey()
  final double lon;

  @override
  String toString() {
    return 'AppSettings(locale: $locale, theme: $theme, weatherLanguage: $weatherLanguage, isFirstLaunch: $isFirstLaunch, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSettings &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.weatherLanguage, weatherLanguage) ||
                other.weatherLanguage == weatherLanguage) &&
            (identical(other.isFirstLaunch, isFirstLaunch) ||
                other.isFirstLaunch == isFirstLaunch) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, locale, theme, weatherLanguage, isFirstLaunch, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppSettingsCopyWith<_$_AppSettings> get copyWith =>
      __$$_AppSettingsCopyWithImpl<_$_AppSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppSettingsToJson(
      this,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      [final AppLocale locale,
      final AppTheme theme,
      final Language weatherLanguage,
      final bool isFirstLaunch,
      final double lat,
      final double lon]) = _$_AppSettings;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$_AppSettings.fromJson;

  @override
  AppLocale get locale;
  @override
  AppTheme get theme;
  @override
  Language get weatherLanguage;
  @override
  bool get isFirstLaunch;
  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingsCopyWith<_$_AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
