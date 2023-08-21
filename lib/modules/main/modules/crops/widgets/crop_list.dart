import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/widgets/empty_data.dart';
import '../providers/crop_provider.dart';
import 'crop_tile.dart';

class CropList extends ConsumerStatefulWidget {
  const CropList({super.key});

  @override
  ConsumerState<CropList> createState() => _CropListState();
}

class _CropListState extends ConsumerState<CropList> {
  @override
  Widget build(BuildContext context) {
    final asyncCrops = ref.watch(asyncCropsProvider);

    return Expanded(
      child: asyncCrops.when(
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
