// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_crop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCrop _$$_UserCropFromJson(Map<String, dynamic> json) => _$_UserCrop(
      uid: json['uid'] as String?,
      userId: json['userId'] as String?,
      nameEn: json['nameEn'] as String?,
      nameVi: json['nameVi'] as String?,
      thumbnail: json['thumbnail'] as String?,
      cropId: json['cropId'] as String?,
      otherCropType: json['otherCropType'] ?? false,
      cropTypeId: json['cropTypeId'] as String?,
      cropTypeVi: json['cropTypeVi'] as String?,
      cropTypeEn: json['cropTypeEn'] as String?,
      cropStatus: $enumDecodeNullable(_$CropStatusEnumMap, json['cropStatus']),
      preparation: json['preparation'] ?? const [],
      tasks: json['tasks'] ?? const [],
      startDate: const TimestampOrNullConverter().fromJson(json['startDate']),
      endDate: const TimestampOrNullConverter().fromJson(json['endDate']),
    );

Map<String, dynamic> _$$_UserCropToJson(_$_UserCrop instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userId': instance.userId,
      'nameEn': instance.nameEn,
      'nameVi': instance.nameVi,
      'thumbnail': instance.thumbnail,
      'cropId': instance.cropId,
      'otherCropType': instance.otherCropType,
      'cropTypeId': instance.cropTypeId,
      'cropTypeVi': instance.cropTypeVi,
      'cropTypeEn': instance.cropTypeEn,
      'cropStatus': _$CropStatusEnumMap[instance.cropStatus],
      'preparation': instance.preparation,
      'tasks': instance.tasks,
      'startDate': const TimestampOrNullConverter().toJson(instance.startDate),
      'endDate': const TimestampOrNullConverter().toJson(instance.endDate),
    };

const _$CropStatusEnumMap = {
  CropStatus.completed: 'completed',
  CropStatus.inprogress: 'inprogress',
  CropStatus.todo: 'todo',
  CropStatus.cancel: 'cancel',
};
