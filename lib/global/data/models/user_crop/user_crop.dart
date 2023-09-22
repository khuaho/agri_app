import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enum/crop_status.dart';
import '../../converters/timestamp_converter.dart';

part 'user_crop.freezed.dart';
part 'user_crop.g.dart';

@freezed
class UserCrop with _$UserCrop {
  const UserCrop._();

  factory UserCrop({
    String? uid,
    String? userId,
    String? nameEn,
    String? nameVi,
    String? thumbnail,
    String? cropId,
    @Default(false) otherCropType,
    String? cropTypeId,
    String? cropTypeVi,
    String? cropTypeEn,
    CropStatus? cropStatus,
    @Default([]) preparation,
    @Default([]) tasks,
    @TimestampOrNullConverter() DateTime? startDate,
    @TimestampOrNullConverter() DateTime? endDate,
  }) = _UserCrop;

  factory UserCrop.fromJson(Map<String, dynamic> json) =>
      _$UserCropFromJson(json);
}

extension UserCropConverter on CollectionReference {
  CollectionReference<UserCrop> withUserCropConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => UserCrop.fromJson(snapshot.data()!),
      toFirestore: (userCrop, _) => userCrop.toJson(),
    );
  }
}
