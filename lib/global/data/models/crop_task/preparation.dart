import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preparation.freezed.dart';
part 'preparation.g.dart';

@freezed
class Preparation with _$Preparation {
  const Preparation._();

  factory Preparation({
    String? uid,
    String? nameEn,
    String? nameVi,
    String? thumbnail,
  }) = _Preparation;

  factory Preparation.fromJson(Map<String, dynamic> json) =>
      _$PreparationFromJson(json);
}

extension PreparationConverter on CollectionReference {
  CollectionReference<Preparation> withPreparationConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => Preparation.fromJson(snapshot.data()!),
      toFirestore: (preparation, _) => preparation.toJson(),
    );
  }
}
