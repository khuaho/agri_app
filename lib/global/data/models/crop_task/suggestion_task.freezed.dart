// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SuggestionTask _$SuggestionTaskFromJson(Map<String, dynamic> json) {
  return _SuggestionTask.fromJson(json);
}

/// @nodoc
mixin _$SuggestionTask {
  String? get uid => throw _privateConstructorUsedError;
  String? get nameEn => throw _privateConstructorUsedError;
  String? get nameVi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionTaskCopyWith<SuggestionTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionTaskCopyWith<$Res> {
  factory $SuggestionTaskCopyWith(
          SuggestionTask value, $Res Function(SuggestionTask) then) =
      _$SuggestionTaskCopyWithImpl<$Res, SuggestionTask>;
  @useResult
  $Res call({String? uid, String? nameEn, String? nameVi});
}

/// @nodoc
class _$SuggestionTaskCopyWithImpl<$Res, $Val extends SuggestionTask>
    implements $SuggestionTaskCopyWith<$Res> {
  _$SuggestionTaskCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SuggestionTaskCopyWith<$Res>
    implements $SuggestionTaskCopyWith<$Res> {
  factory _$$_SuggestionTaskCopyWith(
          _$_SuggestionTask value, $Res Function(_$_SuggestionTask) then) =
      __$$_SuggestionTaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, String? nameEn, String? nameVi});
}

/// @nodoc
class __$$_SuggestionTaskCopyWithImpl<$Res>
    extends _$SuggestionTaskCopyWithImpl<$Res, _$_SuggestionTask>
    implements _$$_SuggestionTaskCopyWith<$Res> {
  __$$_SuggestionTaskCopyWithImpl(
      _$_SuggestionTask _value, $Res Function(_$_SuggestionTask) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? nameEn = freezed,
    Object? nameVi = freezed,
  }) {
    return _then(_$_SuggestionTask(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SuggestionTask extends _SuggestionTask {
  _$_SuggestionTask({this.uid, this.nameEn, this.nameVi}) : super._();

  factory _$_SuggestionTask.fromJson(Map<String, dynamic> json) =>
      _$$_SuggestionTaskFromJson(json);

  @override
  final String? uid;
  @override
  final String? nameEn;
  @override
  final String? nameVi;

  @override
  String toString() {
    return 'SuggestionTask(uid: $uid, nameEn: $nameEn, nameVi: $nameVi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestionTask &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameVi, nameVi) || other.nameVi == nameVi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, nameEn, nameVi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestionTaskCopyWith<_$_SuggestionTask> get copyWith =>
      __$$_SuggestionTaskCopyWithImpl<_$_SuggestionTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SuggestionTaskToJson(
      this,
    );
  }
}

abstract class _SuggestionTask extends SuggestionTask {
  factory _SuggestionTask(
      {final String? uid,
      final String? nameEn,
      final String? nameVi}) = _$_SuggestionTask;
  _SuggestionTask._() : super._();

  factory _SuggestionTask.fromJson(Map<String, dynamic> json) =
      _$_SuggestionTask.fromJson;

  @override
  String? get uid;
  @override
  String? get nameEn;
  @override
  String? get nameVi;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestionTaskCopyWith<_$_SuggestionTask> get copyWith =>
      throw _privateConstructorUsedError;
}
