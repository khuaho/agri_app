// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String? get uid => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get cropId => throw _privateConstructorUsedError;
  Map<String, String> get content => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userReactedId => throw _privateConstructorUsedError;
  String? get userReactedName => throw _privateConstructorUsedError;
  dynamic get isRead => throw _privateConstructorUsedError;
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String? uid,
      String? type,
      String? cropId,
      Map<String, String> content,
      String? userId,
      String? userReactedId,
      String? userReactedName,
      dynamic isRead,
      @TimestampOrNullConverter() DateTime? createdAt});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? type = freezed,
    Object? cropId = freezed,
    Object? content = null,
    Object? userId = freezed,
    Object? userReactedId = freezed,
    Object? userReactedName = freezed,
    Object? isRead = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      cropId: freezed == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userReactedId: freezed == userReactedId
          ? _value.userReactedId
          : userReactedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userReactedName: freezed == userReactedName
          ? _value.userReactedName
          : userReactedName // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$_NotificationCopyWith(
          _$_Notification value, $Res Function(_$_Notification) then) =
      __$$_NotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? type,
      String? cropId,
      Map<String, String> content,
      String? userId,
      String? userReactedId,
      String? userReactedName,
      dynamic isRead,
      @TimestampOrNullConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_NotificationCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$_Notification>
    implements _$$_NotificationCopyWith<$Res> {
  __$$_NotificationCopyWithImpl(
      _$_Notification _value, $Res Function(_$_Notification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? type = freezed,
    Object? cropId = freezed,
    Object? content = null,
    Object? userId = freezed,
    Object? userReactedId = freezed,
    Object? userReactedName = freezed,
    Object? isRead = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Notification(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      cropId: freezed == cropId
          ? _value.cropId
          : cropId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userReactedId: freezed == userReactedId
          ? _value.userReactedId
          : userReactedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userReactedName: freezed == userReactedName
          ? _value.userReactedName
          : userReactedName // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead ? _value.isRead! : isRead,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Notification extends _Notification {
  _$_Notification(
      {this.uid,
      this.type,
      this.cropId,
      final Map<String, String> content = const {},
      this.userId,
      this.userReactedId,
      this.userReactedName,
      this.isRead = false,
      @TimestampOrNullConverter() this.createdAt})
      : _content = content,
        super._();

  factory _$_Notification.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationFromJson(json);

  @override
  final String? uid;
  @override
  final String? type;
  @override
  final String? cropId;
  final Map<String, String> _content;
  @override
  @JsonKey()
  Map<String, String> get content {
    if (_content is EqualUnmodifiableMapView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_content);
  }

  @override
  final String? userId;
  @override
  final String? userReactedId;
  @override
  final String? userReactedName;
  @override
  @JsonKey()
  final dynamic isRead;
  @override
  @TimestampOrNullConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Notification(uid: $uid, type: $type, cropId: $cropId, content: $content, userId: $userId, userReactedId: $userReactedId, userReactedName: $userReactedName, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Notification &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cropId, cropId) || other.cropId == cropId) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userReactedId, userReactedId) ||
                other.userReactedId == userReactedId) &&
            (identical(other.userReactedName, userReactedName) ||
                other.userReactedName == userReactedName) &&
            const DeepCollectionEquality().equals(other.isRead, isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      type,
      cropId,
      const DeepCollectionEquality().hash(_content),
      userId,
      userReactedId,
      userReactedName,
      const DeepCollectionEquality().hash(isRead),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      __$$_NotificationCopyWithImpl<_$_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationToJson(
      this,
    );
  }
}

abstract class _Notification extends Notification {
  factory _Notification(
      {final String? uid,
      final String? type,
      final String? cropId,
      final Map<String, String> content,
      final String? userId,
      final String? userReactedId,
      final String? userReactedName,
      final dynamic isRead,
      @TimestampOrNullConverter() final DateTime? createdAt}) = _$_Notification;
  _Notification._() : super._();

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$_Notification.fromJson;

  @override
  String? get uid;
  @override
  String? get type;
  @override
  String? get cropId;
  @override
  Map<String, String> get content;
  @override
  String? get userId;
  @override
  String? get userReactedId;
  @override
  String? get userReactedName;
  @override
  dynamic get isRead;
  @override
  @TimestampOrNullConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationCopyWith<_$_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
