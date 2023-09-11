// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CropType _$CropTypeFromJson(Map<String, dynamic> json) {
  return _CropType.fromJson(json);
}

/// @nodoc
mixin _$CropType {
  String? get id => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  String? get nameVi => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String get desVi => throw _privateConstructorUsedError;
  String get desEn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CropTypeCopyWith<CropType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropTypeCopyWith<$Res> {
  factory $CropTypeCopyWith(CropType value, $Res Function(CropType) then) =
      _$CropTypeCopyWithImpl<$Res, CropType>;
  @useResult
  $Res call(
      {String? id,
      String? uid,
      String? nameVi,
      String? nameEn,
      String desVi,
      String desEn});
}

/// @nodoc
class _$CropTypeCopyWithImpl<$Res, $Val extends CropType>
    implements $CropTypeCopyWith<$Res> {
  _$CropTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? nameVi = freezed,
    Object? nameEn = freezed,
    Object? desVi = null,
    Object? desEn = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      nameVi: freezed == nameVi
          ? _value.nameVi
          : nameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      desVi: null == desVi
          ? _value.desVi
          : desVi // ignore: cast_nullable_to_non_nullable
              as String,
      desEn: null == desEn
          ? _value.desEn
          : desEn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CropTypeCopyWith<$Res> implements $CropTypeCopyWith<$Res> {
  factory _$$_CropTypeCopyWith(
          _$_CropType value, $Res Function(_$_CropType) then) =
      __$$_CropTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? uid,
      String? nameVi,
      String? nameEn,
      String desVi,
      String desEn});
}

/// @nodoc
class __$$_CropTypeCopyWithImpl<$Res>
    extends _$CropTypeCopyWithImpl<$Res, _$_CropType>
    implements _$$_CropTypeCopyWith<$Res> {
  __$$_CropTypeCopyWithImpl(
      _$_CropType _value, $Res Function(_$_CropType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? nameVi = freezed,
    Object? nameEn = freezed,
    Object? desVi = null,
    Object? desEn = null,
  }) {
    return _then(_$_CropType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      nameVi: freezed == nameVi
          ? _value.nameVi
          : nameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      desVi: null == desVi
          ? _value.desVi
          : desVi // ignore: cast_nullable_to_non_nullable
              as String,
      desEn: null == desEn
          ? _value.desEn
          : desEn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CropType extends _CropType {
  _$_CropType(
      {this.id,
      this.uid,
      this.nameVi,
      this.nameEn,
      required this.desVi,
      required this.desEn})
      : super._();

  factory _$_CropType.fromJson(Map<String, dynamic> json) =>
      _$$_CropTypeFromJson(json);

  @override
  final String? id;
  @override
  final String? uid;
  @override
  final String? nameVi;
  @override
  final String? nameEn;
  @override
  final String desVi;
  @override
  final String desEn;

  @override
  String toString() {
    return 'CropType(id: $id, uid: $uid, nameVi: $nameVi, nameEn: $nameEn, desVi: $desVi, desEn: $desEn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CropType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nameVi, nameVi) || other.nameVi == nameVi) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.desVi, desVi) || other.desVi == desVi) &&
            (identical(other.desEn, desEn) || other.desEn == desEn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uid, nameVi, nameEn, desVi, desEn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CropTypeCopyWith<_$_CropType> get copyWith =>
      __$$_CropTypeCopyWithImpl<_$_CropType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CropTypeToJson(
      this,
    );
  }
}

abstract class _CropType extends CropType {
  factory _CropType(
      {final String? id,
      final String? uid,
      final String? nameVi,
      final String? nameEn,
      required final String desVi,
      required final String desEn}) = _$_CropType;
  _CropType._() : super._();

  factory _CropType.fromJson(Map<String, dynamic> json) = _$_CropType.fromJson;

  @override
  String? get id;
  @override
  String? get uid;
  @override
  String? get nameVi;
  @override
  String? get nameEn;
  @override
  String get desVi;
  @override
  String get desEn;
  @override
  @JsonKey(ignore: true)
  _$$_CropTypeCopyWith<_$_CropType> get copyWith =>
      throw _privateConstructorUsedError;
}
