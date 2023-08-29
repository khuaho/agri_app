import 'package:freezed_annotation/freezed_annotation.dart';

part 'reaction_data.freezed.dart';

@freezed
class ReactionData with _$ReactionData {
  const factory ReactionData({
    @Default(0) int amount,
  }) = _ReactionData;
}

@freezed
class ReactionUserData with _$ReactionUserData {
  const factory ReactionUserData({
    @Default({}) Map<String, String> userOfReaction,
  }) = _ReactionUserData;
}
