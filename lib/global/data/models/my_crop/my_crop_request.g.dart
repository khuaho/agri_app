// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_crop_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyCropRequest _$$_MyCropRequestFromJson(Map<String, dynamic> json) =>
    _$_MyCropRequest(
      uid: json['uid'] as String?,
      nameEn: json['nameEn'] as String?,
      nameVi: json['nameVi'] as String?,
      thumbnail: json['thumbnail'] as String?,
      cropId: json['cropId'] as String?,
      cropTypeId: json['cropTypeId'] as String?,
      cropTypeVi: json['cropTypeVi'] as String?,
      cropTypeEn: json['cropTypeEn'] as String?,
      otherCropType: json['otherCropType'] ?? false,
      cropStatus: $enumDecodeNullable(_$CropStatusEnumMap, json['cropStatus']),
      startDate: const TimestampOrNullConverter().fromJson(json['startDate']),
      endDate: const TimestampOrNullConverter().fromJson(json['endDate']),
    );

Map<String, dynamic> _$$_MyCropRequestToJson(_$_MyCropRequest instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'nameEn': instance.nameEn,
      'nameVi': instance.nameVi,
      'thumbnail': instance.thumbnail,
      'cropId': instance.cropId,
      'cropTypeId': instance.cropTypeId,
      'cropTypeVi': instance.cropTypeVi,
      'cropTypeEn': instance.cropTypeEn,
      'otherCropType': instance.otherCropType,
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
