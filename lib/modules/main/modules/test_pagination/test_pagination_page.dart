import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/pagination_provider.dart';
import 'widgets/items_list.dart';
// import 'widgets/no_more_items.dart';
import 'widgets/no_more_items.dart';
import 'widgets/on_going_bottom_widget.dart';

@RoutePage()
class TestPaginationPage extends ConsumerStatefulWidget {
  const TestPaginationPage({super.key});

  @override
  ConsumerState<TestPaginationPage> createState() =>
      _CropsPaginationPageState();
}

class _CropsPaginationPageState extends ConsumerState<TestPaginationPage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = MediaQuery.of(context).size.width * 0.20;
    if (maxScroll - currentScroll <= delta) {
      ref.read(itemsProvider.notifier).fetchNextBatch();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // scrollController.addListener(() {
    //   double maxScroll = scrollController.position.maxScrollExtent;
    //   double currentScroll = scrollController.position.pixels;
    //   double delta = MediaQuery.of(context).size.width * 0.20;
    //   if (maxScroll - currentScroll <= delta) {
    //     ref.read(itemsProvider.notifier).fetchNextBatch();
    //   }
    // });

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        restorationId: 'Items List',
        slivers: const [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            title: Text('Infinite pagination'),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          ItemsList(),
          NoMoreItems(),
          OnGoingBottomWidget(),
        ],
      ),
    );
  }
}
