// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'installation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Installation _$InstallationFromJson(Map<String, dynamic> json) {
  return _Installation.fromJson(json);
}

/// @nodoc
mixin _$Installation {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get os => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstallationCopyWith<Installation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstallationCopyWith<$Res> {
  factory $InstallationCopyWith(
          Installation value, $Res Function(Installation) then) =
      _$InstallationCopyWithImpl<$Res, Installation>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? token,
      String? os,
      String? deviceId,
      String? version,
      @TimestampOrNullConverter() DateTime? createdAt});
}

/// @nodoc
class _$InstallationCopyWithImpl<$Res, $Val extends Installation>
    implements $InstallationCopyWith<$Res> {
  _$InstallationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? os = freezed,
    Object? deviceId = freezed,
    Object? version = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      os: freezed == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InstallationCopyWith<$Res>
    implements $InstallationCopyWith<$Res> {
  factory _$$_InstallationCopyWith(
          _$_Installation value, $Res Function(_$_Installation) then) =
      __$$_InstallationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String? token,
      String? os,
      String? deviceId,
      String? version,
      @TimestampOrNullConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_InstallationCopyWithImpl<$Res>
    extends _$InstallationCopyWithImpl<$Res, _$_Installation>
    implements _$$_InstallationCopyWith<$Res> {
  __$$_InstallationCopyWithImpl(
      _$_Installation _value, $Res Function(_$_Installation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? token = freezed,
    Object? os = freezed,
    Object? deviceId = freezed,
    Object? version = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Installation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      os: freezed == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Installation extends _Installation {
  _$_Installation(
      {this.id,
      this.userId,
      this.token,
      this.os,
      this.deviceId,
      this.version,
      @TimestampOrNullConverter() this.createdAt})
      : super._();

  factory _$_Installation.fromJson(Map<String, dynamic> json) =>
      _$$_InstallationFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? token;
  @override
  final String? os;
  @override
  final String? deviceId;
  @override
  final String? version;
  @override
  @TimestampOrNullConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Installation(id: $id, userId: $userId, token: $token, os: $os, deviceId: $deviceId, version: $version, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Installation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, token, os, deviceId, version, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InstallationCopyWith<_$_Installation> get copyWith =>
      __$$_InstallationCopyWithImpl<_$_Installation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InstallationToJson(
      this,
    );
  }
}

abstract class _Installation extends Installation {
  factory _Installation(
      {final String? id,
      final String? userId,
      final String? token,
      final String? os,
      final String? deviceId,
      final String? version,
      @TimestampOrNullConverter() final DateTime? createdAt}) = _$_Installation;
  _Installation._() : super._();

  factory _Installation.fromJson(Map<String, dynamic> json) =
      _$_Installation.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  String? get token;
  @override
  String? get os;
  @override
  String? get deviceId;
  @override
  String? get version;
  @override
  @TimestampOrNullConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_InstallationCopyWith<_$_Installation> get copyWith =>
      throw _privateConstructorUsedError;
}
