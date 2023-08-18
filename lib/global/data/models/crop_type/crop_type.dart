import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop_type.freezed.dart';
part 'crop_type.g.dart';

@freezed
class CropType with _$CropType {
  const CropType._();

  factory CropType({
    String? id,
    required String nameVi,
    required String nameEn,
    required String desVi,
    required String desEn,
  }) = _CropType;

  factory CropType.fromJson(Map<String, dynamic> json) =>
      _$CropTypeFromJson(json);
}

extension CropTypeConverter on CollectionReference {
  CollectionReference<CropType> withDocConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => CropType.fromJson(snapshot.data()!),
      toFirestore: (cropType, _) => cropType.toJson(),
    );
  }
}
