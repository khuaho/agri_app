import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enum/crop_status.dart';
import '../../converters/timestamp_converter.dart';

part 'my_crop_request.freezed.dart';
part 'my_crop_request.g.dart';

@freezed
class MyCropRequest with _$MyCropRequest {
  const MyCropRequest._();

  factory MyCropRequest({
    String? uid,
    String? nameEn,
    String? nameVi,
    String? thumbnail,
    String? cropId,
    String? cropTypeId,
    String? cropTypeVi,
    String? cropTypeEn,
    @Default(false) otherCropType,
    CropStatus? cropStatus,
    @TimestampOrNullConverter() DateTime? startDate,
    @TimestampOrNullConverter() DateTime? endDate,
  }) = _MyCropRequest;

  factory MyCropRequest.fromJson(Map<String, dynamic> json) =>
      _$MyCropRequestFromJson(json);
}

extension MyCropRequestConverter on CollectionReference {
  CollectionReference<MyCropRequest> withMyCropRequestConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => MyCropRequest.fromJson(snapshot.data()!),
      toFirestore: (myCrop, _) => myCrop.toJson(),
    );
  }
}
