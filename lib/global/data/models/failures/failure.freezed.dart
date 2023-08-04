// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(FirebaseException e) firebase,
    required TResult Function(Object data) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
    required TResult Function(String message) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(FirebaseException e)? firebase,
    TResult? Function(Object data)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
    TResult? Function(String message)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(FirebaseException e)? firebase,
    TResult Function(Object data)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    TResult Function(String message)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_firebaseFailure value) firebase,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
    required TResult Function(_otherFailure value) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_firebaseFailure value)? firebase,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
    TResult? Function(_otherFailure value)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_firebaseFailure value)? firebase,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    TResult Function(_otherFailure value)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_unknownFailureCopyWith<$Res> {
  factory _$$_unknownFailureCopyWith(
          _$_unknownFailure value, $Res Function(_$_unknownFailure) then) =
      __$$_unknownFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Object data});
}

/// @nodoc
class __$$_unknownFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_unknownFailure>
    implements _$$_unknownFailureCopyWith<$Res> {
  __$$_unknownFailureCopyWithImpl(
      _$_unknownFailure _value, $Res Function(_$_unknownFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_unknownFailure(
      null == data ? _value.data : data,
    ));
  }
}

/// @nodoc

class _$_unknownFailure implements _unknownFailure {
  const _$_unknownFailure(this.data);

  @override
  final Object data;

  @override
  String toString() {
    return 'Failure.unknown(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_unknownFailure &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_unknownFailureCopyWith<_$_unknownFailure> get copyWith =>
      __$$_unknownFailureCopyWithImpl<_$_unknownFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(FirebaseException e) firebase,
    required TResult Function(Object data) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
    required TResult Function(String message) other,
  }) {
    return unknown(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(FirebaseException e)? firebase,
    TResult? Function(Object data)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
    TResult? Function(String message)? other,
  }) {
    return unknown?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(FirebaseException e)? firebase,
    TResult Function(Object data)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    TResult Function(String message)? other,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_firebaseFailure value) firebase,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
    required TResult Function(_otherFailure value) other,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_firebaseFailure value)? firebase,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
    TResult? Function(_otherFailure value)? other,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_firebaseFailure value)? firebase,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    TResult Function(_otherFailure value)? other,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _unknownFailure implements Failure {
  const factory _unknownFailure(final Object data) = _$_unknownFailure;

  Object get data;
  @JsonKey(ignore: true)
  _$$_unknownFailureCopyWith<_$_unknownFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_firebaseFailureCopyWith<$Res> {
  factory _$$_firebaseFailureCopyWith(
          _$_firebaseFailure value, $Res Function(_$_firebaseFailure) then) =
      __$$_firebaseFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseException e});
}

/// @nodoc
class __$$_firebaseFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_firebaseFailure>
    implements _$$_firebaseFailureCopyWith<$Res> {
  __$$_firebaseFailureCopyWithImpl(
      _$_firebaseFailure _value, $Res Function(_$_firebaseFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$_firebaseFailure(
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as FirebaseException,
    ));
  }
}

/// @nodoc

class _$_firebaseFailure implements _firebaseFailure {
  const _$_firebaseFailure(this.e);

  @override
  final FirebaseException e;

  @override
  String toString() {
    return 'Failure.firebase(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_firebaseFailure &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_firebaseFailureCopyWith<_$_firebaseFailure> get copyWith =>
      __$$_firebaseFailureCopyWithImpl<_$_firebaseFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(FirebaseException e) firebase,
    required TResult Function(Object data) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
    required TResult Function(String message) other,
  }) {
    return firebase(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(FirebaseException e)? firebase,
    TResult? Function(Object data)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
    TResult? Function(String message)? other,
  }) {
    return firebase?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(FirebaseException e)? firebase,
    TResult Function(Object data)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    TResult Function(String message)? other,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_firebaseFailure value) firebase,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
    required TResult Function(_otherFailure value) other,
  }) {
    return firebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_firebaseFailure value)? firebase,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
    TResult? Function(_otherFailure value)? other,
  }) {
    return firebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_firebaseFailure value)? firebase,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    TResult Function(_otherFailure value)? other,
    required TResult orElse(),
  }) {
    if (firebase != null) {
      return firebase(this);
    }
    return orElse();
  }
}

abstract class _firebaseFailure implements Failure {
  const factory _firebaseFailure(final FirebaseException e) =
      _$_firebaseFailure;

  FirebaseException get e;
  @JsonKey(ignore: true)
  _$$_firebaseFailureCopyWith<_$_firebaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_illegalDataFailureCopyWith<$Res> {
  factory _$$_illegalDataFailureCopyWith(_$_illegalDataFailure value,
          $Res Function(_$_illegalDataFailure) then) =
      __$$_illegalDataFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({Object data});
}

/// @nodoc
class __$$_illegalDataFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_illegalDataFailure>
    implements _$$_illegalDataFailureCopyWith<$Res> {
  __$$_illegalDataFailureCopyWithImpl(
      _$_illegalDataFailure _value, $Res Function(_$_illegalDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_illegalDataFailure(
      null == data ? _value.data : data,
    ));
  }
}

/// @nodoc

class _$_illegalDataFailure implements _illegalDataFailure {
  const _$_illegalDataFailure(this.data);

  @override
  final Object data;

  @override
  String toString() {
    return 'Failure.illegalData(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_illegalDataFailure &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_illegalDataFailureCopyWith<_$_illegalDataFailure> get copyWith =>
      __$$_illegalDataFailureCopyWithImpl<_$_illegalDataFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(FirebaseException e) firebase,
    required TResult Function(Object data) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
    required TResult Function(String message) other,
  }) {
    return illegalData(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(FirebaseException e)? firebase,
    TResult? Function(Object data)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
    TResult? Function(String message)? other,
  }) {
    return illegalData?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(FirebaseException e)? firebase,
    TResult Function(Object data)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    TResult Function(String message)? other,
    required TResult orElse(),
  }) {
    if (illegalData != null) {
      return illegalData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_firebaseFailure value) firebase,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
    required TResult Function(_otherFailure value) other,
  }) {
    return illegalData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_firebaseFailure value)? firebase,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
    TResult? Function(_otherFailure value)? other,
  }) {
    return illegalData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_firebaseFailure value)? firebase,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    TResult Function(_otherFailure value)? other,
    required TResult orElse(),
  }) {
    if (illegalData != null) {
      return illegalData(this);
    }
    return orElse();
  }
}

abstract class _illegalDataFailure implements Failure {
  const factory _illegalDataFailure(final Object data) = _$_illegalDataFailure;

  Object get data;
  @JsonKey(ignore: true)
  _$$_illegalDataFailureCopyWith<_$_illegalDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_networkFailureCopyWith<$Res> {
  factory _$$_networkFailureCopyWith(
          _$_networkFailure value, $Res Function(_$_networkFailure) then) =
      __$$_networkFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_networkFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_networkFailure>
    implements _$$_networkFailureCopyWith<$Res> {
  __$$_networkFailureCopyWithImpl(
      _$_networkFailure _value, $Res Function(_$_networkFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_networkFailure implements _networkFailure {
  const _$_networkFailure();

  @override
  String toString() {
    return 'Failure.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_networkFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(FirebaseException e) firebase,
    required TResult Function(Object data) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
    required TResult Function(String message) other,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(FirebaseException e)? firebase,
    TResult? Function(Object data)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
    TResult? Function(String message)? other,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(FirebaseException e)? firebase,
    TResult Function(Object data)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    TResult Function(String message)? other,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_firebaseFailure value) firebase,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
    required TResult Function(_otherFailure value) other,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_firebaseFailure value)? firebase,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
    TResult? Function(_otherFailure value)? other,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_firebaseFailure value)? firebase,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    TResult Function(_otherFailure value)? other,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _networkFailure implements Failure {
  const factory _networkFailure() = _$_networkFailure;
}

/// @nodoc
abstract class _$$_permissionDeniedFailureCopyWith<$Res> {
  factory _$$_permissionDeniedFailureCopyWith(_$_permissionDeniedFailure value,
          $Res Function(_$_permissionDeniedFailure) then) =
      __$$_permissionDeniedFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_permissionDeniedFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_permissionDeniedFailure>
    implements _$$_permissionDeniedFailureCopyWith<$Res> {
  __$$_permissionDeniedFailureCopyWithImpl(_$_permissionDeniedFailure _value,
      $Res Function(_$_permissionDeniedFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_permissionDeniedFailure implements _permissionDeniedFailure {
  const _$_permissionDeniedFailure();

  @override
  String toString() {
    return 'Failure.permissionDenied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_permissionDeniedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(FirebaseException e) firebase,
    required TResult Function(Object data) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
    required TResult Function(String message) other,
  }) {
    return permissionDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(FirebaseException e)? firebase,
    TResult? Function(Object data)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
    TResult? Function(String message)? other,
  }) {
    return permissionDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(FirebaseException e)? firebase,
    TResult Function(Object data)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    TResult Function(String message)? other,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_firebaseFailure value) firebase,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
    required TResult Function(_otherFailure value) other,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_firebaseFailure value)? firebase,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
    TResult? Function(_otherFailure value)? other,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_firebaseFailure value)? firebase,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    TResult Function(_otherFailure value)? other,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class _permissionDeniedFailure implements Failure {
  const factory _permissionDeniedFailure() = _$_permissionDeniedFailure;
}

/// @nodoc
abstract class _$$_otherFailureCopyWith<$Res> {
  factory _$$_otherFailureCopyWith(
          _$_otherFailure value, $Res Function(_$_otherFailure) then) =
      __$$_otherFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_otherFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_otherFailure>
    implements _$$_otherFailureCopyWith<$Res> {
  __$$_otherFailureCopyWithImpl(
      _$_otherFailure _value, $Res Function(_$_otherFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_otherFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_otherFailure implements _otherFailure {
  const _$_otherFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.other(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_otherFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_otherFailureCopyWith<_$_otherFailure> get copyWith =>
      __$$_otherFailureCopyWithImpl<_$_otherFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object data) unknown,
    required TResult Function(FirebaseException e) firebase,
    required TResult Function(Object data) illegalData,
    required TResult Function() network,
    required TResult Function() permissionDenied,
    required TResult Function(String message) other,
  }) {
    return other(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object data)? unknown,
    TResult? Function(FirebaseException e)? firebase,
    TResult? Function(Object data)? illegalData,
    TResult? Function()? network,
    TResult? Function()? permissionDenied,
    TResult? Function(String message)? other,
  }) {
    return other?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object data)? unknown,
    TResult Function(FirebaseException e)? firebase,
    TResult Function(Object data)? illegalData,
    TResult Function()? network,
    TResult Function()? permissionDenied,
    TResult Function(String message)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_unknownFailure value) unknown,
    required TResult Function(_firebaseFailure value) firebase,
    required TResult Function(_illegalDataFailure value) illegalData,
    required TResult Function(_networkFailure value) network,
    required TResult Function(_permissionDeniedFailure value) permissionDenied,
    required TResult Function(_otherFailure value) other,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_unknownFailure value)? unknown,
    TResult? Function(_firebaseFailure value)? firebase,
    TResult? Function(_illegalDataFailure value)? illegalData,
    TResult? Function(_networkFailure value)? network,
    TResult? Function(_permissionDeniedFailure value)? permissionDenied,
    TResult? Function(_otherFailure value)? other,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_unknownFailure value)? unknown,
    TResult Function(_firebaseFailure value)? firebase,
    TResult Function(_illegalDataFailure value)? illegalData,
    TResult Function(_networkFailure value)? network,
    TResult Function(_permissionDeniedFailure value)? permissionDenied,
    TResult Function(_otherFailure value)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class _otherFailure implements Failure {
  const factory _otherFailure(final String message) = _$_otherFailure;

  String get message;
  @JsonKey(ignore: true)
  _$$_otherFailureCopyWith<_$_otherFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
