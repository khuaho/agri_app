// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CropType _$$_CropTypeFromJson(Map<String, dynamic> json) => _$_CropType(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      nameVi: json['nameVi'] as String?,
      nameEn: json['nameEn'] as String?,
      desVi: json['desVi'] as String,
      desEn: json['desEn'] as String,
    );

Map<String, dynamic> _$$_CropTypeToJson(_$_CropType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'nameVi': instance.nameVi,
      'nameEn': instance.nameEn,
      'desVi': instance.desVi,
      'desEn': instance.desEn,
    };
