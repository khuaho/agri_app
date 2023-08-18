import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/timestamp_converter.dart';

part 'crop.freezed.dart';
part 'crop.g.dart';

@freezed
class Crop with _$Crop {
  const Crop._();

  factory Crop({
    String? uid,
    String? nameEn,
    String? nameVi,
    String? desEn,
    String? desVi,
    String? thumbnail,
    List<String>? images,
    String? cropTypeVi,
    String? cropTypeEn,
    @TimestampOrNullConverter() DateTime? createdAt,
  }) = _Crop;

  factory Crop.fromJson(Map<String, dynamic> json) => _$CropFromJson(json);
}

extension CropConverter on CollectionReference {
  CollectionReference<Crop> withDocConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => Crop.fromJson(snapshot.data()!),
      toFirestore: (crop, _) => crop.toJson(),
    );
  }
}
