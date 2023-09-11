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
      cropTypeId: json['cropTypeId'] as String?,
      cropTypeVi: json['cropTypeVi'] as String?,
      cropTypeEn: json['cropTypeEn'] as String?,
      plantingPotEn: json['plantingPotEn'] as String?,
      plantingPotVi: json['plantingPotVi'] as String?,
      seedThumbnail: json['seedThumbnail'] as String?,
      wateringEn: json['wateringEn'] as String?,
      wateringVi: json['wateringVi'] as String?,
      weedingVi: json['weedingVi'] as String?,
      weedingEn: json['weedingEn'] as String?,
      manureEn: json['manureEn'] as String?,
      manureVi: json['manureVi'] as String?,
      plantingSeasonEn: (json['plantingSeasonEn'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      plantingSeasonVi: (json['plantingSeasonVi'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      landForPlantingVi: (json['landForPlantingVi'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      landForPlantingEn: (json['landForPlantingEn'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      seedIncubationEn: (json['seedIncubationEn'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      seedIncubationVi: (json['seedIncubationVi'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      growVi: (json['growVi'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      growEn: (json['growEn'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
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
      'cropTypeId': instance.cropTypeId,
      'cropTypeVi': instance.cropTypeVi,
      'cropTypeEn': instance.cropTypeEn,
      'plantingPotEn': instance.plantingPotEn,
      'plantingPotVi': instance.plantingPotVi,
      'seedThumbnail': instance.seedThumbnail,
      'wateringEn': instance.wateringEn,
      'wateringVi': instance.wateringVi,
      'weedingVi': instance.weedingVi,
      'weedingEn': instance.weedingEn,
      'manureEn': instance.manureEn,
      'manureVi': instance.manureVi,
      'plantingSeasonEn': instance.plantingSeasonEn,
      'plantingSeasonVi': instance.plantingSeasonVi,
      'landForPlantingVi': instance.landForPlantingVi,
      'landForPlantingEn': instance.landForPlantingEn,
      'seedIncubationEn': instance.seedIncubationEn,
      'seedIncubationVi': instance.seedIncubationVi,
      'growVi': instance.growVi,
      'growEn': instance.growEn,
      'createdAt': const TimestampOrNullConverter().toJson(instance.createdAt),
    };
