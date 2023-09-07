// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_crop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyCrop _$$_MyCropFromJson(Map<String, dynamic> json) => _$_MyCrop(
      uid: json['uid'] as String?,
      nameEn: json['nameEn'] as String?,
      nameVi: json['nameVi'] as String?,
      thumbnail: json['thumbnail'] as String?,
      cropTypeVi: json['cropTypeVi'] as String?,
      cropTypeEn: json['cropTypeEn'] as String?,
      cropStatus: $enumDecodeNullable(_$CropStatusEnumMap, json['cropStatus']),
      startDate: const TimestampOrNullConverter().fromJson(json['startDate']),
      endDate: const TimestampOrNullConverter().fromJson(json['endDate']),
    );

Map<String, dynamic> _$$_MyCropToJson(_$_MyCrop instance) => <String, dynamic>{
      'uid': instance.uid,
      'nameEn': instance.nameEn,
      'nameVi': instance.nameVi,
      'thumbnail': instance.thumbnail,
      'cropTypeVi': instance.cropTypeVi,
      'cropTypeEn': instance.cropTypeEn,
      'cropStatus': _$CropStatusEnumMap[instance.cropStatus],
      'startDate': const TimestampOrNullConverter().toJson(instance.startDate),
      'endDate': const TimestampOrNullConverter().toJson(instance.endDate),
    };

const _$CropStatusEnumMap = {
  CropStatus.completed: 'completed',
  CropStatus.inprogress: 'inprogress',
  CropStatus.todo: 'todo',
  CropStatus.cancel: 'cancel',
};
