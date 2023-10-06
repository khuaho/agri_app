// import 'dart:async';
// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../../global/data/models/failures/failure.dart';
// import '../../../../../global/data/models/pagination/pagination_state.dart';
// import '../../../../../global/data/models/post/post.dart';
// import '../../../../../global/data/repositories/post_repository.dart';

// final itemsProvider2 =
//     StateNotifierProvider<PaginationNotifier<Post>, PaginationState<Post>>(
//   (ref) {
//     return PaginationNotifier(
//       itemsPerBatch: 10,
//       fetchNextItems: (item) {
//         return ref.read(postRepositoryProvider).getPosts(item);
//       },
//     )..init();
//   },
// );

// class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
//   PaginationNotifier({
//     required this.fetchNextItems,
//     required this.itemsPerBatch,
//   }) : super(const PaginationState.loading());

//   final Future<Either<Failure, List<T>>> Function(T? item) fetchNextItems;
//   final int itemsPerBatch;

//   final List<T> _items = [];

//   Timer _timer = Timer(const Duration(milliseconds: 0), () {});

//   bool noMoreItems = false;

//   void init() {
//     if (_items.isEmpty) {
//       fetchFirstBatch();
//     }
//   }

//   void updateData(List<T> result) {
//     noMoreItems = result.length < itemsPerBatch;

//     if (result.isEmpty) {
//       state = PaginationState.data(_items);
//     } else {
//       state = PaginationState.data(_items..addAll(result));
//     }
//   }

//   Future<void> fetchFirstBatch() async {
//     state = const PaginationState.loading();

//     final result = _items.isEmpty
//         ? await fetchNextItems(null)
//         : await fetchNextItems(_items.last);

//     result.fold(
//       (l) {
//         state = PaginationState.failure(l);
//       },
//       (r) {
//         updateData(r);
//       },
//     );
//   }

//   Future<void> fetchNextBatch() async {
//     if (_timer.isActive && _items.isNotEmpty) {
//       return;
//     }
//     _timer = Timer(const Duration(milliseconds: 1000), () {});

//     if (noMoreItems) {
//       return;
//     }

//     if (state == PaginationState<T>.onGoingLoading(_items)) {
//       log('Rejected');
//       return;
//     }

//     log('Fetching next batch of items');

//     state = PaginationState.onGoingLoading(_items);

//     await Future.delayed(const Duration(seconds: 1));

//     final result = await fetchNextItems(_items.last);

//     result.fold(
//       (l) {
//         log('Error fetching next page', error: l);
//         state = PaginationState.failure(l);
//       },
//       (r) {
//         log(r.length.toString());
//         updateData(r);
//       },
//     );
//   }
// }
