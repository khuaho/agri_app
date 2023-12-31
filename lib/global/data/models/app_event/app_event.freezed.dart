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
    required TResult Function() changeLanguage,
    required TResult Function() upsertNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
    TResult? Function()? changeLanguage,
    TResult? Function()? upsertNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    TResult Function()? changeLanguage,
    TResult Function()? upsertNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserEvent value) updateUser,
    required TResult Function(CreateMyCropEvent value) createMyCrop,
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
    required TResult Function(UpsertNotificationEvent value) upsertNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
    TResult? Function(UpsertNotificationEvent value)? upsertNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    TResult Function(UpsertNotificationEvent value)? upsertNotification,
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
    required TResult Function() changeLanguage,
    required TResult Function() upsertNotification,
  }) {
    return updateUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
    TResult? Function()? changeLanguage,
    TResult? Function()? upsertNotification,
  }) {
    return updateUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    TResult Function()? changeLanguage,
    TResult Function()? upsertNotification,
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
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
    required TResult Function(UpsertNotificationEvent value) upsertNotification,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
    TResult? Function(UpsertNotificationEvent value)? upsertNotification,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    TResult Function(UpsertNotificationEvent value)? upsertNotification,
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
    required TResult Function() changeLanguage,
    required TResult Function() upsertNotification,
  }) {
    return createMyCrop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
    TResult? Function()? changeLanguage,
    TResult? Function()? upsertNotification,
  }) {
    return createMyCrop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    TResult Function()? changeLanguage,
    TResult Function()? upsertNotification,
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
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
    required TResult Function(UpsertNotificationEvent value) upsertNotification,
  }) {
    return createMyCrop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
    TResult? Function(UpsertNotificationEvent value)? upsertNotification,
  }) {
    return createMyCrop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    TResult Function(UpsertNotificationEvent value)? upsertNotification,
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

/// @nodoc
abstract class _$$ChangeLanguageEventCopyWith<$Res> {
  factory _$$ChangeLanguageEventCopyWith(_$ChangeLanguageEvent value,
          $Res Function(_$ChangeLanguageEvent) then) =
      __$$ChangeLanguageEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeLanguageEventCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ChangeLanguageEvent>
    implements _$$ChangeLanguageEventCopyWith<$Res> {
  __$$ChangeLanguageEventCopyWithImpl(
      _$ChangeLanguageEvent _value, $Res Function(_$ChangeLanguageEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeLanguageEvent implements ChangeLanguageEvent {
  const _$ChangeLanguageEvent();

  @override
  String toString() {
    return 'AppEvent.changeLanguage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeLanguageEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() updateUser,
    required TResult Function() createMyCrop,
    required TResult Function() changeLanguage,
    required TResult Function() upsertNotification,
  }) {
    return changeLanguage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
    TResult? Function()? changeLanguage,
    TResult? Function()? upsertNotification,
  }) {
    return changeLanguage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    TResult Function()? changeLanguage,
    TResult Function()? upsertNotification,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserEvent value) updateUser,
    required TResult Function(CreateMyCropEvent value) createMyCrop,
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
    required TResult Function(UpsertNotificationEvent value) upsertNotification,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
    TResult? Function(UpsertNotificationEvent value)? upsertNotification,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    TResult Function(UpsertNotificationEvent value)? upsertNotification,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class ChangeLanguageEvent implements AppEvent {
  const factory ChangeLanguageEvent() = _$ChangeLanguageEvent;
}

/// @nodoc
abstract class _$$UpsertNotificationEventCopyWith<$Res> {
  factory _$$UpsertNotificationEventCopyWith(_$UpsertNotificationEvent value,
          $Res Function(_$UpsertNotificationEvent) then) =
      __$$UpsertNotificationEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpsertNotificationEventCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpsertNotificationEvent>
    implements _$$UpsertNotificationEventCopyWith<$Res> {
  __$$UpsertNotificationEventCopyWithImpl(_$UpsertNotificationEvent _value,
      $Res Function(_$UpsertNotificationEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpsertNotificationEvent implements UpsertNotificationEvent {
  const _$UpsertNotificationEvent();

  @override
  String toString() {
    return 'AppEvent.upsertNotification()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpsertNotificationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() updateUser,
    required TResult Function() createMyCrop,
    required TResult Function() changeLanguage,
    required TResult Function() upsertNotification,
  }) {
    return upsertNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? updateUser,
    TResult? Function()? createMyCrop,
    TResult? Function()? changeLanguage,
    TResult? Function()? upsertNotification,
  }) {
    return upsertNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? updateUser,
    TResult Function()? createMyCrop,
    TResult Function()? changeLanguage,
    TResult Function()? upsertNotification,
    required TResult orElse(),
  }) {
    if (upsertNotification != null) {
      return upsertNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserEvent value) updateUser,
    required TResult Function(CreateMyCropEvent value) createMyCrop,
    required TResult Function(ChangeLanguageEvent value) changeLanguage,
    required TResult Function(UpsertNotificationEvent value) upsertNotification,
  }) {
    return upsertNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserEvent value)? updateUser,
    TResult? Function(CreateMyCropEvent value)? createMyCrop,
    TResult? Function(ChangeLanguageEvent value)? changeLanguage,
    TResult? Function(UpsertNotificationEvent value)? upsertNotification,
  }) {
    return upsertNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserEvent value)? updateUser,
    TResult Function(CreateMyCropEvent value)? createMyCrop,
    TResult Function(ChangeLanguageEvent value)? changeLanguage,
    TResult Function(UpsertNotificationEvent value)? upsertNotification,
    required TResult orElse(),
  }) {
    if (upsertNotification != null) {
      return upsertNotification(this);
    }
    return orElse();
  }
}

abstract class UpsertNotificationEvent implements AppEvent {
  const factory UpsertNotificationEvent() = _$UpsertNotificationEvent;
}
