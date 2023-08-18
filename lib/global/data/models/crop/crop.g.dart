// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Crop _$$_CropFromJson(Map<String, dynamic> json) => _$_Crop(
      uid: json['uid'] as String?,
      nameEn: json['nameEn'] as String?,
      nameVi: json['nameVi'] as String?,
      desEn: json['desEn'] as String?,
      desVi: json['desVi'] as String?,
      thumbnail: json['thumbnail'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      cropTypeVi: json['cropTypeVi'] as String?,
      cropTypeEn: json['cropTypeEn'] as String?,
      createdAt: const TimestampOrNullConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_CropToJson(_$_Crop instance) => <String, dynamic>{
      'uid': instance.uid,
      'nameEn': instance.nameEn,
      'nameVi': instance.nameVi,
      'desEn': instance.desEn,
      'desVi': instance.desVi,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
      'cropTypeVi': instance.cropTypeVi,
      'cropTypeEn': instance.cropTypeEn,
      'createdAt': const TimestampOrNullConverter().toJson(instance.createdAt),
    };
