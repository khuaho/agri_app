// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Installation _$$_InstallationFromJson(Map<String, dynamic> json) =>
    _$_Installation(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      token: json['token'] as String?,
      os: json['os'] as String?,
      deviceId: json['deviceId'] as String?,
      version: json['version'] as String?,
      createdAt: const TimestampOrNullConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_InstallationToJson(_$_Installation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'token': instance.token,
      'os': instance.os,
      'deviceId': instance.deviceId,
      'version': instance.version,
      'createdAt': const TimestampOrNullConverter().toJson(instance.createdAt),
    };
