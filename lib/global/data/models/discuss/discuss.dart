import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/timestamp_converter.dart';

part 'discuss.freezed.dart';
part 'discuss.g.dart';

@freezed
class Discuss with _$Discuss {
  const Discuss._();

  factory Discuss({
    String? uid,
    String? fullName,
    String? role,
    String? userId,
    String? content,
    String? avatar,
    @Default({}) Map<String, String> reactionsOfUser,
    @Default([]) List<int> reactions,
    @TimestampOrNullConverter() DateTime? createdAt,
  }) = _Discuss;

  factory Discuss.fromJson(Map<String, dynamic> json) =>
      _$DiscussFromJson(json);
}

extension UserConverter on CollectionReference {
  CollectionReference<Discuss> withDiscussConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => Discuss.fromJson(snapshot.data()!),
      toFirestore: (discuss, _) => discuss.toJson(),
    );
  }
}
