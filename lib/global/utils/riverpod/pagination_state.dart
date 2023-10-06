import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/failures/failure.dart';

part 'pagination_state.freezed.dart';

@freezed
abstract class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.data(List<T> items) = _Data;
  const factory PaginationState.loading() = _Loading;
  const factory PaginationState.failure(Failure e) = _Failure;
  const factory PaginationState.error(Object? e, [StackTrace? stk]) = _Error;
  const factory PaginationState.onGoingLoading(List<T> items) = _OnGoingLoading;
  const factory PaginationState.onGoingError(List<T> items, Object? e,
      [StackTrace? stk]) = _OnGoingError;
  const factory PaginationState.onGoingFailure(List<T> items, Failure? e) =
      _OnGoingFailure;
}
