// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() updateUser,
    required TResult Function() createMyCrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserEvent value) updateUser,
    required TResult Function(CreateMyCropEvent value) createMyCrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateUserEventCopyWith<$Res> {
  factory _$$UpdateUserEventCopyWith(
          _$UpdateUserEvent value, $Res Function(_$UpdateUserEvent) then) =
      __$$UpdateUserEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateUserEventCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateUserEvent>
    implements _$$UpdateUserEventCopyWith<$Res> {
  __$$UpdateUserEventCopyWithImpl(
      _$UpdateUserEvent _value, $Res Function(_$UpdateUserEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateUserEvent implements UpdateUserEvent {
  const _$UpdateUserEvent();

  @override
  String toString() {
    return 'AppEvent.updateUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateUserEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() updateUser,
    required TResult Function() createMyCrop,
  }) {
    return updateUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
  }) {
    return updateUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserEvent value) updateUser,
    required TResult Function(CreateMyCropEvent value) createMyCrop,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class UpdateUserEvent implements AppEvent {
  const factory UpdateUserEvent() = _$UpdateUserEvent;
}

/// @nodoc
abstract class _$$CreateMyCropEventCopyWith<$Res> {
  factory _$$CreateMyCropEventCopyWith(
          _$CreateMyCropEvent value, $Res Function(_$CreateMyCropEvent) then) =
      __$$CreateMyCropEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateMyCropEventCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$CreateMyCropEvent>
    implements _$$CreateMyCropEventCopyWith<$Res> {
  __$$CreateMyCropEventCopyWithImpl(
      _$CreateMyCropEvent _value, $Res Function(_$CreateMyCropEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateMyCropEvent implements CreateMyCropEvent {
  const _$CreateMyCropEvent();

  @override
  String toString() {
    return 'AppEvent.createMyCrop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateMyCropEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() updateUser,
    required TResult Function() createMyCrop,
  }) {
    return createMyCrop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
  }) {
    return createMyCrop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    required TResult orElse(),
  }) {
    if (createMyCrop != null) {
      return createMyCrop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserEvent value) updateUser,
    required TResult Function(CreateMyCropEvent value) createMyCrop,
  }) {
    return createMyCrop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
  }) {
    return createMyCrop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    required TResult orElse(),
  }) {
    if (createMyCrop != null) {
      return createMyCrop(this);
    }
    return orElse();
  }
}

abstract class CreateMyCropEvent implements AppEvent {
  const factory CreateMyCropEvent() = _$CreateMyCropEvent;
}
