// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preparation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Preparation _$PreparationFromJson(Map<String, dynamic> json) {
  return _Preparation.fromJson(json);
}

/// @nodoc
mixin _$Preparation {
  String? get uid => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get nameVi => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreparationCopyWith<Preparation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreparationCopyWith<$Res> {
  factory $PreparationCopyWith(
          Preparation value, $Res Function(Preparation) then) =
      _$PreparationCopyWithImpl<$Res, Preparation>;
  @useResult
  $Res call({String? uid, String? nameEn, String? nameVi, String? thumbnail});
}

/// @nodoc
class _$PreparationCopyWithImpl<$Res, $Val extends Preparation>
    implements $PreparationCopyWith<$Res> {
  _$PreparationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? nameEn = freezed,
    Object? nameVi = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameVi: freezed == nameVi
          ? _value.nameVi
          : nameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PreparationCopyWith<$Res>
    implements $PreparationCopyWith<$Res> {
  factory _$$_PreparationCopyWith(
          _$_Preparation value, $Res Function(_$_Preparation) then) =
      __$$_PreparationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, String? nameEn, String? nameVi, String? thumbnail});
}

/// @nodoc
class __$$_PreparationCopyWithImpl<$Res>
    extends _$PreparationCopyWithImpl<$Res, _$_Preparation>
    implements _$$_PreparationCopyWith<$Res> {
  __$$_PreparationCopyWithImpl(
      _$_Preparation _value, $Res Function(_$_Preparation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? nameEn = freezed,
    Object? nameVi = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_Preparation(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      nameEn: freezed == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameVi: freezed == nameVi
          ? _value.nameVi
          : nameVi // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Preparation extends _Preparation {
  _$_Preparation({this.uid, this.nameEn, this.nameVi, this.thumbnail})
      : super._();

  factory _$_Preparation.fromJson(Map<String, dynamic> json) =>
      _$$_PreparationFromJson(json);

  @override
  final String? uid;
  @override
  final String? nameEn;
  @override
  final String? nameVi;
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'Preparation(uid: $uid, nameEn: $nameEn, nameVi: $nameVi, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Preparation &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameVi, nameVi) || other.nameVi == nameVi) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nameEn, nameVi, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreparationCopyWith<_$_Preparation> get copyWith =>
      __$$_PreparationCopyWithImpl<_$_Preparation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreparationToJson(
      this,
    );
  }
}

abstract class _Preparation extends Preparation {
  factory _Preparation(
      {final String? uid,
      final String? nameEn,
      final String? nameVi,
      final String? thumbnail}) = _$_Preparation;
  _Preparation._() : super._();

  factory _Preparation.fromJson(Map<String, dynamic> json) =
      _$_Preparation.fromJson;

  @override
  String? get uid;
  @override
  String? get nameEn;
  @override
  String? get nameVi;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_PreparationCopyWith<_$_Preparation> get copyWith =>
      throw _privateConstructorUsedError;
}
