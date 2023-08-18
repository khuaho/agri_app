// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettings _$$_AppSettingsFromJson(Map<String, dynamic> json) =>
    _$_AppSettings(
      json['isFirstLaunch'] as bool? ?? true,
      (json['lat'] as num?)?.toDouble() ?? 0,
      (json['lon'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_AppSettingsToJson(_$_AppSettings instance) =>
    <String, dynamic>{
      'isFirstLaunch': instance.isFirstLaunch,
      'lat': instance.lat,
      'lon': instance.lon,
    };
