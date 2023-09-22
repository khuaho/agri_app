import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/app_router/app_router.dart';
import '../../../../../../../global/data/models/user_crop/user_crop.dart';
import '../../../../../../../global/enum/crop_status.dart';
import '../../../../../../../global/extensions/date_time_ext.dart';
import '../../../../../../../global/gen/strings.g.dart';
import '../../../../../../../global/themes/app_colors.dart';
import '../../../../../../../global/utils/app_icons.dart';
import '../../../../../../../global/utils/app_mixin.dart';
import '../../../../../../../global/utils/constants.dart';
import '../../../../../../../global/widgets/crop_status_tile.dart';
import '../../../../../../../global/widgets/dialogs/confirmation_dialog.dart';
import '../../../../../../../global/widgets/shadow_wrapper.dart';
import '../../../../../../../global/widgets/shimmer/shimmer_image.dart';
import '../../upsert/providers/upsert_my_crop_provider.dart';

class MyCropTile extends ConsumerStatefulWidget {
  const MyCropTile({
    super.key,
    required this.myCrop,
  });

  final UserCrop myCrop;

  @override
  ConsumerState<MyCropTile> createState() => _MyCropTileState();
}

class _MyCropTileState extends ConsumerState<MyCropTile> with AppMixin {
  late final upsertProvider =
      ref.read(upsertMyCropProvider(widget.myCrop.uid).notifier);

  void handleSubmit(CropStatus? status) {
    final transl = Translations.of(context);
    final data = widget.myCrop.copyWith(
      cropStatus: status,
      endDate: status == CropStatus.completed ? DateTime.now() : null,
    );
    // ignore: unused_result
    showAlertDialog(
      context: context,
      builder: (ctx, child) => ConfirmationDialog(
        title: transl.upsertMyCrop.updateCropProfile,
        content: transl.upsertMyCrop.updateCropDes,
        onTapOk: () async {
          await upsertProvider.upsertMyCrop(data);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;

    return GestureDetector(
      onTap: () async {
        await context.pushRoute(UpsertMyCropRoute(id: widget.myCrop.uid!));
        if (!mounted) return;
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
                imageUrl: widget.myCrop.thumbnail ?? Constants.defaultThumbnail,
                fit: BoxFit.contain,
                width: 80,
                height: 80,
              ),
              const VerticalDivider(color: AppColors.neutral07),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'ID: ${widget.myCrop.uid}',
                      style: textTheme.titleSmall?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              isEn
                                  ? widget.myCrop.nameEn ?? '_'
                                  : widget.myCrop.nameVi ?? '_',
                              style: textTheme.titleSmall,
                            ),
                          ),
                          CropStatusTile(cropStatus: widget.myCrop.cropStatus),
                        ],
                      ),
                    ),
                    if (widget.myCrop.cropStatus != CropStatus.completed ||
                        widget.myCrop.cropStatus != CropStatus.cancel)
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
                                ? widget.myCrop.cropTypeEn ?? '_'
                                : widget.myCrop.cropTypeVi ?? '_',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (widget.myCrop.cropStatus != CropStatus.todo)
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
                            Expanded(
                              child: Text(
                                '${widget.myCrop.startDate?.formatDate()} - ${widget.myCrop.endDate?.formatDate() ?? transl.myCrops.now}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    (widget.myCrop.cropStatus != null)
                        ? () {
                            switch (widget.myCrop.cropStatus!) {
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
                                  onPressed: () =>
                                      handleSubmit(CropStatus.completed),
                                  child: Text(transl.myCrops.complete),
                                );
                              case CropStatus.todo:
                                return Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.neutral05,
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          minimumSize: const Size(
                                            double.infinity,
                                            30,
                                          ),
                                        ),
                                        onPressed: () =>
                                            handleSubmit(CropStatus.cancel),
                                        child: Text(transl.myCrops.cancel),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
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
                                        onPressed: () =>
                                            handleSubmit(CropStatus.inprogress),
                                        child: Text(transl.myCrops.perform),
                                      ),
                                    ),
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
