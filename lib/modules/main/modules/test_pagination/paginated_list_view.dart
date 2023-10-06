// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'providers/pagination_provider.dart';
// import 'widgets/items_list.dart';
// import 'widgets/no_more_items.dart';
// import 'widgets/on_going_bottom_widget.dart';

// class PaginatedListView extends ConsumerStatefulWidget {
//   const PaginatedListView({super.key});

//   @override
//   ConsumerState<PaginatedListView> createState() => _PaginatedListViewState();
// }

// class _PaginatedListViewState extends ConsumerState<PaginatedListView> {
//   final ScrollController scrollController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     scrollController.addListener(() {
//       double maxScroll = scrollController.position.maxScrollExtent;
//       double currentScroll = scrollController.position.pixels;
//       double delta = MediaQuery.of(context).size.width * 0.20;
//       if (maxScroll - currentScroll <= delta) {
//         ref.read(itemsProvider.notifier).fetchNextBatch();
//       }
//     });

//     return Scaffold(
//       body: CustomScrollView(
//         controller: scrollController,
//         restorationId: 'Items List',
//         slivers: const [
//           SliverAppBar(
//             centerTitle: true,
//             pinned: true,
//             title: Text('Infinite pagination'),
//           ),
//           SliverToBoxAdapter(
//             child: SizedBox(
//               height: 20,
//             ),
//           ),
//           ItemsList(),
//           NoMoreItems(),
//           OnGoingBottomWidget(),
//         ],
//       ),
//     );
//   }
// }
