// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discuss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Discuss _$$_DiscussFromJson(Map<String, dynamic> json) => _$_Discuss(
      uid: json['uid'] as String?,
      fullName: json['fullName'] as String?,
      role: json['role'] as String?,
      userId: json['userId'] as String?,
      content: json['content'] as String?,
      avatar: json['avatar'] as String?,
      reactionsOfUser: (json['reactionsOfUser'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      reactions: (json['reactions'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      createdAt: const TimestampOrNullConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_DiscussToJson(_$_Discuss instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'role': instance.role,
      'userId': instance.userId,
      'content': instance.content,
      'avatar': instance.avatar,
      'reactionsOfUser': instance.reactionsOfUser,
      'reactions': instance.reactions,
      'createdAt': const TimestampOrNullConverter().toJson(instance.createdAt),
    };
