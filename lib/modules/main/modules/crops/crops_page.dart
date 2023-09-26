import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../global/gen/strings.g.dart';
import 'model/crop_filter_data.dart';
import 'providers/search_crop_provider.dart';
import 'widgets/crop_list.dart';
import 'widgets/crops_search_bar.dart';
import 'widgets/crops_search_result.dart';

@RoutePage()
class CropsPage extends ConsumerStatefulWidget {
  const CropsPage({super.key});

  @override
  ConsumerState<CropsPage> createState() => _CropsPageState();
}

class _CropsPageState extends ConsumerState<CropsPage> {
  late final keywordProvider = ref.read(searchKeywordProvider.notifier);
  CropFilterData initialFilter = const CropFilterData();
  void handleFilterChange(CropFilterData data) {
    setState(() {
      initialFilter = data;
    });
    keywordProvider.update((state) => data.keyword ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

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
            ref.watch(searchKeywordProvider).isNotEmpty
                ? const CropSearchResult()
                : const CropList()
          ],
        ),
      ),
    );
  }
}
