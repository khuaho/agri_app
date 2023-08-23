// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      fcmToken: json['fcmToken'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'username': instance.username,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'email': instance.email,
      'fcmToken': instance.fcmToken,
      'uid': instance.uid,
    };
