// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crop_filter_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CropFilterData {
  String? get keyword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CropFilterDataCopyWith<CropFilterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropFilterDataCopyWith<$Res> {
  factory $CropFilterDataCopyWith(
          CropFilterData value, $Res Function(CropFilterData) then) =
      _$CropFilterDataCopyWithImpl<$Res, CropFilterData>;
  @useResult
  $Res call({String? keyword});
}

/// @nodoc
class _$CropFilterDataCopyWithImpl<$Res, $Val extends CropFilterData>
    implements $CropFilterDataCopyWith<$Res> {
  _$CropFilterDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CropFilterDataCopyWith<$Res>
    implements $CropFilterDataCopyWith<$Res> {
  factory _$$_CropFilterDataCopyWith(
          _$_CropFilterData value, $Res Function(_$_CropFilterData) then) =
      __$$_CropFilterDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? keyword});
}

/// @nodoc
class __$$_CropFilterDataCopyWithImpl<$Res>
    extends _$CropFilterDataCopyWithImpl<$Res, _$_CropFilterData>
    implements _$$_CropFilterDataCopyWith<$Res> {
  __$$_CropFilterDataCopyWithImpl(
      _$_CropFilterData _value, $Res Function(_$_CropFilterData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
  }) {
    return _then(_$_CropFilterData(
      freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CropFilterData implements _CropFilterData {
  const _$_CropFilterData([this.keyword]);

  @override
  final String? keyword;

  @override
  String toString() {
    return 'CropFilterData(keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CropFilterData &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CropFilterDataCopyWith<_$_CropFilterData> get copyWith =>
      __$$_CropFilterDataCopyWithImpl<_$_CropFilterData>(this, _$identity);
}

abstract class _CropFilterData implements CropFilterData {
  const factory _CropFilterData([final String? keyword]) = _$_CropFilterData;

  @override
  String? get keyword;
  @override
  @JsonKey(ignore: true)
  _$$_CropFilterDataCopyWith<_$_CropFilterData> get copyWith =>
      throw _privateConstructorUsedError;
}
