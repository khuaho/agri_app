// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discuss.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Discuss _$DiscussFromJson(Map<String, dynamic> json) {
  return _Discuss.fromJson(json);
}

/// @nodoc
mixin _$Discuss {
  String? get uid => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  Map<String, String> get reactionsOfUser => throw _privateConstructorUsedError;
  List<int> get reactions => throw _privateConstructorUsedError;
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussCopyWith<Discuss> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussCopyWith<$Res> {
  factory $DiscussCopyWith(Discuss value, $Res Function(Discuss) then) =
      _$DiscussCopyWithImpl<$Res, Discuss>;
  @useResult
  $Res call(
      {String? uid,
      String? fullName,
      String? role,
      String? userId,
      String? content,
      String? avatar,
      Map<String, String> reactionsOfUser,
      List<int> reactions,
      @TimestampOrNullConverter() DateTime? createdAt});
}

/// @nodoc
class _$DiscussCopyWithImpl<$Res, $Val extends Discuss>
    implements $DiscussCopyWith<$Res> {
  _$DiscussCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? fullName = freezed,
    Object? role = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? avatar = freezed,
    Object? reactionsOfUser = null,
    Object? reactions = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      reactionsOfUser: null == reactionsOfUser
          ? _value.reactionsOfUser
          : reactionsOfUser // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      reactions: null == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscussCopyWith<$Res> implements $DiscussCopyWith<$Res> {
  factory _$$_DiscussCopyWith(
          _$_Discuss value, $Res Function(_$_Discuss) then) =
      __$$_DiscussCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? fullName,
      String? role,
      String? userId,
      String? content,
      String? avatar,
      Map<String, String> reactionsOfUser,
      List<int> reactions,
      @TimestampOrNullConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_DiscussCopyWithImpl<$Res>
    extends _$DiscussCopyWithImpl<$Res, _$_Discuss>
    implements _$$_DiscussCopyWith<$Res> {
  __$$_DiscussCopyWithImpl(_$_Discuss _value, $Res Function(_$_Discuss) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? fullName = freezed,
    Object? role = freezed,
    Object? userId = freezed,
    Object? content = freezed,
    Object? avatar = freezed,
    Object? reactionsOfUser = null,
    Object? reactions = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Discuss(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      reactionsOfUser: null == reactionsOfUser
          ? _value._reactionsOfUser
          : reactionsOfUser // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      reactions: null == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Discuss extends _Discuss {
  _$_Discuss(
      {this.uid,
      this.fullName,
      this.role,
      this.userId,
      this.content,
      this.avatar,
      final Map<String, String> reactionsOfUser = const {},
      final List<int> reactions = const [],
      @TimestampOrNullConverter() this.createdAt})
      : _reactionsOfUser = reactionsOfUser,
        _reactions = reactions,
        super._();

  factory _$_Discuss.fromJson(Map<String, dynamic> json) =>
      _$$_DiscussFromJson(json);

  @override
  final String? uid;
  @override
  final String? fullName;
  @override
  final String? role;
  @override
  final String? userId;
  @override
  final String? content;
  @override
  final String? avatar;
  final Map<String, String> _reactionsOfUser;
  @override
  @JsonKey()
  Map<String, String> get reactionsOfUser {
    if (_reactionsOfUser is EqualUnmodifiableMapView) return _reactionsOfUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_reactionsOfUser);
  }

  final List<int> _reactions;
  @override
  @JsonKey()
  List<int> get reactions {
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reactions);
  }

  @override
  @TimestampOrNullConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Discuss(uid: $uid, fullName: $fullName, role: $role, userId: $userId, content: $content, avatar: $avatar, reactionsOfUser: $reactionsOfUser, reactions: $reactions, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Discuss &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality()
                .equals(other._reactionsOfUser, _reactionsOfUser) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      fullName,
      role,
      userId,
      content,
      avatar,
      const DeepCollectionEquality().hash(_reactionsOfUser),
      const DeepCollectionEquality().hash(_reactions),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscussCopyWith<_$_Discuss> get copyWith =>
      __$$_DiscussCopyWithImpl<_$_Discuss>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscussToJson(
      this,
    );
  }
}

abstract class _Discuss extends Discuss {
  factory _Discuss(
      {final String? uid,
      final String? fullName,
      final String? role,
      final String? userId,
      final String? content,
      final String? avatar,
      final Map<String, String> reactionsOfUser,
      final List<int> reactions,
      @TimestampOrNullConverter() final DateTime? createdAt}) = _$_Discuss;
  _Discuss._() : super._();

  factory _Discuss.fromJson(Map<String, dynamic> json) = _$_Discuss.fromJson;

  @override
  String? get uid;
  @override
  String? get fullName;
  @override
  String? get role;
  @override
  String? get userId;
  @override
  String? get content;
  @override
  String? get avatar;
  @override
  Map<String, String> get reactionsOfUser;
  @override
  List<int> get reactions;
  @override
  @TimestampOrNullConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_DiscussCopyWith<_$_Discuss> get copyWith =>
      throw _privateConstructorUsedError;
}
