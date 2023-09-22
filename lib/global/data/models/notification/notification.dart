import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/timestamp_converter.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const Notification._();

  factory Notification({
    String? uid,
    String? type,
    String? cropId,
    @Default({}) Map<String, String> content,
    String? userId,
    String? userReactedId,
    String? userReactedName,
    @Default(false) isRead,
    @TimestampOrNullConverter() DateTime? createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

extension NotificationConverter on CollectionReference {
  CollectionReference<Notification> withNotificationConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => Notification.fromJson(snapshot.data()!),
      toFirestore: (notification, _) => notification.toJson(),
    );
  }
}
