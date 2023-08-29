// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reaction_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReactionData {
  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReactionDataCopyWith<ReactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionDataCopyWith<$Res> {
  factory $ReactionDataCopyWith(
          ReactionData value, $Res Function(ReactionData) then) =
      _$ReactionDataCopyWithImpl<$Res, ReactionData>;
  @useResult
  $Res call({int amount});
}

/// @nodoc
class _$ReactionDataCopyWithImpl<$Res, $Val extends ReactionData>
    implements $ReactionDataCopyWith<$Res> {
  _$ReactionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReactionDataCopyWith<$Res>
    implements $ReactionDataCopyWith<$Res> {
  factory _$$_ReactionDataCopyWith(
          _$_ReactionData value, $Res Function(_$_ReactionData) then) =
      __$$_ReactionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount});
}

/// @nodoc
class __$$_ReactionDataCopyWithImpl<$Res>
    extends _$ReactionDataCopyWithImpl<$Res, _$_ReactionData>
    implements _$$_ReactionDataCopyWith<$Res> {
  __$$_ReactionDataCopyWithImpl(
      _$_ReactionData _value, $Res Function(_$_ReactionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$_ReactionData(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ReactionData implements _ReactionData {
  const _$_ReactionData({this.amount = 0});

  @override
  @JsonKey()
  final int amount;

  @override
  String toString() {
    return 'ReactionData(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReactionData &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReactionDataCopyWith<_$_ReactionData> get copyWith =>
      __$$_ReactionDataCopyWithImpl<_$_ReactionData>(this, _$identity);
}

abstract class _ReactionData implements ReactionData {
  const factory _ReactionData({final int amount}) = _$_ReactionData;

  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$_ReactionDataCopyWith<_$_ReactionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReactionUserData {
  Map<String, String> get userOfReaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReactionUserDataCopyWith<ReactionUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionUserDataCopyWith<$Res> {
  factory $ReactionUserDataCopyWith(
          ReactionUserData value, $Res Function(ReactionUserData) then) =
      _$ReactionUserDataCopyWithImpl<$Res, ReactionUserData>;
  @useResult
  $Res call({Map<String, String> userOfReaction});
}

/// @nodoc
class _$ReactionUserDataCopyWithImpl<$Res, $Val extends ReactionUserData>
    implements $ReactionUserDataCopyWith<$Res> {
  _$ReactionUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userOfReaction = null,
  }) {
    return _then(_value.copyWith(
      userOfReaction: null == userOfReaction
          ? _value.userOfReaction
          : userOfReaction // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReactionUserDataCopyWith<$Res>
    implements $ReactionUserDataCopyWith<$Res> {
  factory _$$_ReactionUserDataCopyWith(
          _$_ReactionUserData value, $Res Function(_$_ReactionUserData) then) =
      __$$_ReactionUserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, String> userOfReaction});
}

/// @nodoc
class __$$_ReactionUserDataCopyWithImpl<$Res>
    extends _$ReactionUserDataCopyWithImpl<$Res, _$_ReactionUserData>
    implements _$$_ReactionUserDataCopyWith<$Res> {
  __$$_ReactionUserDataCopyWithImpl(
      _$_ReactionUserData _value, $Res Function(_$_ReactionUserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userOfReaction = null,
  }) {
    return _then(_$_ReactionUserData(
      userOfReaction: null == userOfReaction
          ? _value._userOfReaction
          : userOfReaction // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$_ReactionUserData implements _ReactionUserData {
  const _$_ReactionUserData(
      {final Map<String, String> userOfReaction = const {}})
      : _userOfReaction = userOfReaction;

  final Map<String, String> _userOfReaction;
  @override
  @JsonKey()
  Map<String, String> get userOfReaction {
    if (_userOfReaction is EqualUnmodifiableMapView) return _userOfReaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userOfReaction);
  }

  @override
  String toString() {
    return 'ReactionUserData(userOfReaction: $userOfReaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReactionUserData &&
            const DeepCollectionEquality()
                .equals(other._userOfReaction, _userOfReaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userOfReaction));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReactionUserDataCopyWith<_$_ReactionUserData> get copyWith =>
      __$$_ReactionUserDataCopyWithImpl<_$_ReactionUserData>(this, _$identity);
}

abstract class _ReactionUserData implements ReactionUserData {
  const factory _ReactionUserData({final Map<String, String> userOfReaction}) =
      _$_ReactionUserData;

  @override
  Map<String, String> get userOfReaction;
  @override
  @JsonKey(ignore: true)
  _$$_ReactionUserDataCopyWith<_$_ReactionUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
