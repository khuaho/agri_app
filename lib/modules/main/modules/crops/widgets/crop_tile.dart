import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../global/app_router/app_router.dart';
import '../../../../../global/data/models/crop/crop.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/widgets/shadow_wrapper.dart';
import '../../../../../global/widgets/shimmer/shimmer_image.dart';
import '../../../../../global/widgets/shimmer/shimmer_wrapper.dart';

class CropTile extends StatelessWidget {
  const CropTile({
    super.key,
    required this.crop,
  });

  final Crop crop;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;

    return GestureDetector(
      onTap: () {
        context.pushRoute(CropDetailRoute(id: crop.uid!));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ShadowWrapper(
          padding: const EdgeInsets.all(12),
          clipBehavior: Clip.hardEdge,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShimmerImage(
                  imageUrl: crop.thumbnail ?? '',
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
                              isEn ? crop.nameEn ?? '' : crop.nameVi ?? '',
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
                            child: Text(
                              isEn
                                  ? crop.cropTypeEn ?? ''
                                  : crop.cropTypeVi ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        isEn ? crop.desEn ?? '' : crop.desVi ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerCropTile extends StatelessWidget {
  const ShimmerCropTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ShadowWrapper(
        padding: const EdgeInsets.all(12),
        clipBehavior: Clip.hardEdge,
        child: ShimmerWrapper(
          child: Container(
            height: 100,
          ),
        ),
      ),
    );
  }
}
