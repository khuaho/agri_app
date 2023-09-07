import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../../global/app_router/app_router.dart';
import '../../../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../../../global/enum/crop_status.dart';
import '../../../../../../../global/extensions/date_time_ext.dart';
import '../../../../../../../global/gen/strings.g.dart';
import '../../../../../../../global/themes/app_colors.dart';
import '../../../../../../../global/utils/app_icons.dart';
import '../../../../../../../global/widgets/crop_status_tile.dart';
import '../../../../../../../global/widgets/shadow_wrapper.dart';
import '../../../../../../../global/widgets/shimmer/shimmer_image.dart';

class MyCropTile extends StatelessWidget {
  const MyCropTile({
    super.key,
    required this.myCrop,
  });

  final MyCrop myCrop;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;

    return GestureDetector(
      onTap: () {
        context.pushRoute(UpsertMyCropRoute(id: myCrop.uid!));
      },
      child: ShadowWrapper(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        borderRadius: 10,
        clipBehavior: Clip.hardEdge,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerImage(
                imageUrl: myCrop.thumbnail ?? '',
                fit: BoxFit.contain,
                width: 80,
                height: 80,
              ),
              const VerticalDivider(color: AppColors.neutral07),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              isEn
                                  ? myCrop.nameEn ?? '_'
                                  : myCrop.nameVi ?? '_',
                              style: textTheme.titleSmall,
                            ),
                          ),
                          CropStatusTile(cropStatus: myCrop.cropStatus),
                        ],
                      ),
                    ),
                    if (myCrop.cropStatus != CropStatus.completed ||
                        myCrop.cropStatus != CropStatus.cancel)
                      const SizedBox(height: 10),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            AppIcons.leaf,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(transl.myCrops.type),
                          const SizedBox(width: 6),
                          Text(
                            isEn
                                ? myCrop.cropTypeEn ?? '_'
                                : myCrop.cropTypeVi ?? '_',
                          ),
                        ],
                      ),
                    ),
                    if (myCrop.cropStatus == CropStatus.inprogress)
                      const SizedBox(height: 10),
                    if (myCrop.cropStatus != CropStatus.todo)
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              size: 14,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(transl.myCrops.date),
                            const SizedBox(width: 6),
                            Text(
                              '${myCrop.startDate?.formatDate()} - ${myCrop.endDate?.formatDate()} ',
                            ),
                          ],
                        ),
                      ),
                    (myCrop.cropStatus != null)
                        ? () {
                            switch (myCrop.cropStatus!) {
                              case CropStatus.completed:
                                return const SizedBox();
                              case CropStatus.inprogress:
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 30),
                                  ),
                                  onPressed: () {
                                    // TODOs: ...
                                  },
                                  child: Text(transl.myCrops.complete),
                                );
                              case CropStatus.todo:
                                return Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.errorDefault,
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          minimumSize:
                                              const Size(double.infinity, 30),
                                        ),
                                        onPressed: () {
                                          // TODOs: ...
                                        },
                                        child: Text(transl.myCrops.perform),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.neutral05,
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          minimumSize:
                                              const Size(double.infinity, 30),
                                        ),
                                        onPressed: () {
                                          // TODOs: ...
                                        },
                                        child: Text(transl.myCrops.cancel),
                                      ),
                                    )
                                  ],
                                );
                              case CropStatus.cancel:
                                return const SizedBox();
                            }
                          }()
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
