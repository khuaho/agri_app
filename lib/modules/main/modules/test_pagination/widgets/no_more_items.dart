import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pagination_provider.dart';

class NoMoreItems extends ConsumerWidget {
  const NoMoreItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(itemsProvider);

    return SliverToBoxAdapter(
      child: state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        data: (items) {
          final nomoreItems = ref.read(itemsProvider.notifier).noMoreItems;
          return nomoreItems
              ? const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'No More Items Found!',
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
