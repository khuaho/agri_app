import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/widgets/empty_data.dart';
import '../providers/search_crop_provider.dart';
import 'crop_tile.dart';

class CropSearchResult extends ConsumerWidget {
  const CropSearchResult({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cropSearch = ref.watch(cropSearchProvider);
    return Expanded(
      child: cropSearch.when(
        data: (crops) {
          if (crops.isEmpty) {
            return const EmptyData();
          }
          return ListView.builder(
            itemCount: crops.length,
            itemBuilder: (_, index) {
              final crop = crops[index];
              return CropTile(crop: crop);
            },
          );
        },
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (_, __) {
              return const ShimmerCropTile();
            },
          );
        },
      ),
    );
  }
}
