import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/timestamp_converter.dart';

part 'installation.freezed.dart';
part 'installation.g.dart';

@freezed
class Installation with _$Installation {
  const Installation._();

  factory Installation({
    String? id,
    String? userId,
    String? token,
    String? os,
    String? deviceId,
    String? version,
    @TimestampOrNullConverter() DateTime? createdAt,
  }) = _Installation;

  factory Installation.fromJson(Map<String, dynamic> json) =>
      _$InstallationFromJson(json);
}

extension InstallationConverter on CollectionReference {
  CollectionReference<Installation> withInstallationConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => Installation.fromJson(snapshot.data()!),
      toFirestore: (installation, _) => installation.toJson(),
    );
  }
}
