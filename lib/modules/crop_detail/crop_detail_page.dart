import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/gen/strings.g.dart';
import '../../global/themes/app_colors.dart';
import '../../global/utils/riverpod/app_state.dart';
import '../../global/widgets/loading_overlay.dart';
import 'providers/crop_detail_provider.dart';
import 'widgets/crop_detail_carousel.dart';
import 'widgets/discusses.dart';
import 'widgets/planting_guide.dart';

@RoutePage()
class CropDetailPage extends ConsumerStatefulWidget {
  const CropDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<CropDetailPage> createState() => _CropDetailPageState();
}

class _CropDetailPageState extends ConsumerState<CropDetailPage>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cropDetailProvider(widget.id));
    final transl = Translations.of(context);
    // final textTheme = Theme.of(context).textTheme;
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;

    return Scaffold(
      appBar: AppBar(
        title: Text(transl.detailCrop.title),
      ),
      body: LoadingOverlay(
        loading: state.isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            CropDetailCarousel(images: state.data?.images ?? []),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                isEn ? state.data?.desEn ?? '' : state.data?.desVi ?? '',
                // style: textTheme.labelLarge,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.neutral09,
                        ),
                        child: TabBar(
                          labelColor: AppColors.white,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primary,
                          ),
                          controller: tabController,
                          tabs: [
                            Text(transl.detailCrop.plantingGuide),
                            Text(transl.detailCrop.discuss),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          PlantingGuide(crop: state.data),
                          Discusses(cropId: widget.id),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
