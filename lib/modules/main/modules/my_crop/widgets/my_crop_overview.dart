import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../global/app_router/app_router.dart';
import '../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../global/enum/crop_status.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/utils/app_icons.dart';
import '../../../../../global/widgets/crop_status_tile.dart';
import '../../../../../global/widgets/shadow_wrapper.dart';
import '../../../../../global/widgets/shimmer/shimmer_image.dart';

class MyCropOverview extends StatelessWidget {
  const MyCropOverview({super.key, this.myCrop});

  final MyCrop? myCrop;

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;

    return ShadowWrapper(
      padding: const EdgeInsets.all(10),
      borderRadius: 8,
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.hardEdge,
            child: ShimmerImage(
              imageUrl: myCrop?.thumbnail ?? '',
              fit: BoxFit.contain,
              height: 100,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        isEn ? myCrop?.nameEn ?? '_' : myCrop?.nameVi ?? '_',
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const CropStatusTile(cropStatus: CropStatus.todo),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const Icon(
                        AppIcons.leaf,
                        size: 14,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        transl.myCrops.type,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isEn
                            ? myCrop?.cropTypeEn ?? '_'
                            : myCrop?.cropTypeVi ?? '_',
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Row(
                //     children: [
                //       const Icon(
                //         AppIcons.leaf,
                //         size: 14,
                //         color: AppColors.primary,
                //       ),
                //       const SizedBox(width: 4),
                //       Text(
                //         transl.myCrops.type,
                //         style: const TextStyle(
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //       const SizedBox(width: 6),
                //       const Text('Rau củ quả'),
                //     ],
                //   ),
                // ),
                ElevatedButton.icon(
                  onPressed: () {
                    context.pushRoute(
                      CropDetailRoute(id: myCrop?.cropId ?? ''),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  icon: const Icon(
                    AppIcons.trefoil_lily,
                    size: 20,
                  ),
                  label: Text(transl.detailCrop.title),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
