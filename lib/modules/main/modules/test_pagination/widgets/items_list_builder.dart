import 'package:flutter/material.dart';

import '../../../../../global/data/models/post/post.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/widgets/avatar.dart';

class ItemsListBuilder extends StatelessWidget {
  const ItemsListBuilder({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Post> items;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = items[index];

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  const Avatar(),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('khua ho'),
                      const SizedBox(height: 6),
                      Text(item.content ?? '_')
                    ],
                  ),
                ],
              ),
            ),
          );
          // return ListTile(

          //   title: Text('Item ${index + 1}'),
          // );
        },
        childCount: items.length,
      ),
    );
  }
}
