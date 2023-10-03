import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../providers/count_provider.dart';

class CropOverview extends ConsumerStatefulWidget {
  const CropOverview({super.key});

  @override
  ConsumerState<CropOverview> createState() => _CropOverviewState();
}

class _CropOverviewState extends ConsumerState<CropOverview> {
  @override
  void didUpdateWidget(covariant CropOverview oldWidget) {
    print('hello update');
    // ignore: unused_result
    ref.refresh(cropCountProvider);
    // ignore: unused_result
    ref.refresh(userCropCountProvider);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    final cropCount = ref.watch(cropCountProvider).value ?? 0;
    final userCropCount = ref.watch(userCropCountProvider).value ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transl.home.totalCrop.toUpperCase(),
          style: textTheme.titleSmall,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _totalCropTile(
              context,
              transl.home.allCrops,
              cropCount,
            ),
            const SizedBox(width: 14),
            _totalCropTile(
              context,
              transl.home.myCrops,
              userCropCount,
            ),
          ],
        ),
      ],
    );
  }

  _totalCropTile(
    BuildContext context,
    String title,
    int total,
  ) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              total.toString(),
              style: textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
