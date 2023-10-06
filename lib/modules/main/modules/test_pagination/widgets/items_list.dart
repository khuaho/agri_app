import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/models/failures/failure.dart';
import '../providers/pagination_provider.dart';
import 'items_list_builder.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(itemsProvider);
      return state.when(
        data: (items) {
          return items.isEmpty
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(itemsProvider.notifier).fetchFirstBatch();
                        },
                        icon: const Icon(Icons.replay),
                      ),
                      const Chip(
                        label: Text('No items Found!'),
                      ),
                    ],
                  ),
                )
              : ItemsListBuilder(
                  items: items,
                );
        },
        loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator())),
        error: (e, stk) => const SliverToBoxAdapter(
          child: Center(
            child: Column(
              children: [
                Icon(Icons.info),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Something Went Wrong!',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        onGoingLoading: (items) {
          return ItemsListBuilder(
            items: items,
          );
        },
        onGoingError: (items, e, stk) {
          return ItemsListBuilder(
            items: items,
          );
        },
        onGoingFailure: (items, e) => const SizedBox(),
        failure: (Failure e) => const SizedBox(),
      );
    });
  }
}
