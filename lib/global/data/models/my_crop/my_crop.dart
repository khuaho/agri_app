import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enum/crop_status.dart';
import '../../converters/timestamp_converter.dart';

part 'my_crop.freezed.dart';
part 'my_crop.g.dart';

@freezed
class MyCrop with _$MyCrop {
  const MyCrop._();

  factory MyCrop({
    String? uid,
    String? nameEn,
    String? nameVi,
    String? thumbnail,
    String? cropTypeVi,
    String? cropTypeEn,
    CropStatus? cropStatus,
    @TimestampOrNullConverter() DateTime? startDate,
    @TimestampOrNullConverter() DateTime? endDate,
  }) = _MyCrop;

  factory MyCrop.fromJson(Map<String, dynamic> json) => _$MyCropFromJson(json);
}

extension MyCropConverter on CollectionReference {
  CollectionReference<MyCrop> withMyCropConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => MyCrop.fromJson(snapshot.data()!),
      toFirestore: (myCrop, _) => myCrop.toJson(),
    );
  }
}
