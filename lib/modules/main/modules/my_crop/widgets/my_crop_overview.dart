import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../global/app_router/app_router.dart';
import '../../../../../global/enum/crop_status.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/utils/app_icons.dart';
import '../../../../../global/widgets/crop_status_tile.dart';
import '../../../../../global/widgets/shadow_wrapper.dart';
import '../../../../../global/widgets/shimmer/shimmer_image.dart';

class MyCropOverview extends StatelessWidget {
  const MyCropOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return ShadowWrapper(
      padding: const EdgeInsets.all(10),
      borderRadius: 8,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.hardEdge,
                child: const ShimmerImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/agriapp-c2b55.appspot.com/o/crops%2Fcabbage_1.jpeg?alt=media&token=f4d6df39-8a78-49d5-9328-7ef8e7c1bf16',
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
                            'Bắp cải',
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
                          const Text('Rau củ quả'),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODOs: ...
                        context.pushRoute(CropDetailRoute(id: ''));
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
                      label: const Text('Chi tiết cây trồng'),
                    )
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  AppIcons.leaf,
                  size: 14,
                  color: AppColors.primary,
                ),
                SizedBox(width: 4),
                Text(
                  'Thời vụ:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 6),
                Expanded(child: Text('6 tháng (Từ tháng 7 - thang 9)')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
