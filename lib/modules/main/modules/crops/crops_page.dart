import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global/gen/strings.g.dart';
import 'model/crop_filter_data.dart';
import 'providers/crop_provider.dart';
import 'widgets/crop_tile.dart';
import 'widgets/crops_search_bar.dart';

@RoutePage()
class CropsPage extends ConsumerStatefulWidget {
  const CropsPage({super.key});

  @override
  ConsumerState<CropsPage> createState() => _CropsPageState();
}

class _CropsPageState extends ConsumerState<CropsPage> {
  final initialFilter = const CropFilterData();
  void handleFilterChange(String value) {}

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    // final textTheme = Theme.of(context).textTheme;
    final crops = ref.watch(cropProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(transl.crops.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CropsSearchBar(
              initialFilter: initialFilter,
              onChanged: handleFilterChange,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: crops.when(
                data: (crops) {
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
            )
          ],
        ),
      ),
    );
  }
}
