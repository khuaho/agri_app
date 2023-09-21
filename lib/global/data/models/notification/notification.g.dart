// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      uid: json['uid'] as String?,
      type: json['type'] as String?,
      cropId: json['cropId'] as String?,
      content: (json['content'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      userId: json['userId'] as String?,
      userReactedId: json['userReactedId'] as String?,
      userReactedName: json['userReactedName'] as String?,
      isRead: json['isRead'] ?? false,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'type': instance.type,
      'cropId': instance.cropId,
      'content': instance.content,
      'userId': instance.userId,
      'userReactedId': instance.userReactedId,
      'userReactedName': instance.userReactedName,
      'isRead': instance.isRead,
    };
