import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../global/themes/app_colors.dart';
import '../../../../global/widgets/shadow_wrapper.dart';
import '../../../../global/widgets/shimmer/shimmer_image.dart';
import 'model/crop_filter_data.dart';
import 'widgets/crops_search_bar.dart';

@RoutePage()
class CropsPage extends StatefulWidget {
  const CropsPage({super.key});

  @override
  State<CropsPage> createState() => _CropsPageState();
}

class _CropsPageState extends State<CropsPage> {
  final initialFilter = const CropFilterData();
  void handleFilterChange(String value) {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crops'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CropsSearchBar(
              initialFilter: initialFilter,
              onChanged: handleFilterChange,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ShadowWrapper(
                    padding: const EdgeInsets.all(12),
                    clipBehavior: Clip.hardEdge,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ShimmerImage(
                            imageUrl:
                                'https://us.123rf.com/450wm/captainvector/captainvector2207/captainvector220720530/189119716-chinese-cabbage.jpg?ver=6',
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                          const VerticalDivider(
                            color: AppColors.neutral07,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Cabbage',
                                        style: textTheme.titleSmall?.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: AppColors.alertSoft,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        'Vegetable',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
