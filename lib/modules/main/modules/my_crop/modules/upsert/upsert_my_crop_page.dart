import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../global/data/models/crop/crop.dart';
import '../../../../../../global/data/models/crop_task/preparation.dart';
import '../../../../../../global/data/models/crop_task/suggestion_task.dart';
import '../../../../../../global/data/models/crop_type/crop_type.dart';
import '../../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../../global/enum/crop_status.dart';
import '../../../../../../global/gen/strings.g.dart';
import '../../../../../../global/themes/app_colors.dart';
import '../../../../../../global/utils/app_mixin.dart';
import '../../../../../../global/widgets/dialogs/confirmation_dialog.dart';
import '../../widgets/my_crop_overview.dart';
import '../../widgets/my_crop_upsert_form.dart';
import 'providers/upsert_my_crop_provider.dart';

@RoutePage()
class UpsertMyCropPage extends ConsumerStatefulWidget {
  const UpsertMyCropPage({super.key, this.id});

  final String? id;

  @override
  ConsumerState<UpsertMyCropPage> createState() => _UpsertMyCropPageState();
}

class _UpsertMyCropPageState extends ConsumerState<UpsertMyCropPage>
    with AppMixin {
  var formKey = GlobalKey<FormBuilderState>();
  MyCrop? myCrop;
  late final upsertProvider =
      ref.read(upsertMyCropProvider(widget.id).notifier);

  MyCrop get formData {
    final formValue = formKey.currentState!.value;
    final cropType = formValue['cropType'] != null
        ? formValue['cropType'] as CropType
        : null;
    final crop = formValue['crop'] != null ? formValue['crop'] as Crop : null;
    final other = formValue['other'] == null || formValue['other'] == false;
    final preparation = formValue['preparation'] != null
        ? formValue['preparation'] as List<Preparation>
        : <Preparation>[];
    final suggestionTasks = formValue['suggestionTasks'] != null
        ? formValue['suggestionTasks'] as List<SuggestionTask>
        : <SuggestionTask>[];

    return MyCrop(
      uid: widget.id,
      otherCropType: formValue['other'],
      nameEn: other ? crop?.nameEn : formValue['otherCropName'],
      nameVi: other ? crop?.nameVi : formValue['otherCropName'],
      thumbnail: crop?.thumbnail,
      cropId: crop?.uid,
      cropTypeId: cropType?.uid,
      cropTypeVi: other ? cropType?.nameVi : formValue['otherCropType'],
      cropTypeEn: other ? cropType?.nameEn : formValue['otherCropType'],
      cropStatus: CropStatus.todo,
      startDate: formValue['startDate'],
      preparation: preparation.map((e) => e.uid).toList(),
      tasks: suggestionTasks.map((e) => e.uid).toList(),
    );
  }

  MyCrop get formData2 {
    final data = myCrop?.copyWith(
      uid: widget.id,
      cropStatus: CropStatus.inprogress,
      startDate: formData.startDate,
      preparation: formData.preparation,
      tasks: formData.tasks,
    );
    return data!;
  }

  void handleReset() {
    setState(() {
      formKey = GlobalKey<FormBuilderState>();
    });
  }

  void handleCancelOrCompleted(CropStatus? status) {
    final transl = Translations.of(context);
    if (formKey.currentState!.saveAndValidate()) {
      final data = myCrop?.copyWith(
        cropStatus: status,
        endDate: status == CropStatus.completed ? DateTime.now() : null,
      );
      // ignore: unused_result
      showAlertDialog(
        context: context,
        builder: (ctx, child) => ConfirmationDialog(
          title: transl.upsertMyCrop.updateCropProfile,
          content: transl.upsertMyCrop.cancelDes,
          onTapOk: () async {
            await upsertProvider.upsertMyCrop(data!);
            if (mounted) {
              context.popRoute();
            }
          },
        ),
      );
    }
  }

  void handleSubmit(CropStatus? status) {
    final transl = Translations.of(context);
    if (formKey.currentState!.saveAndValidate()) {
      // ignore: unused_result
      showAlertDialog(
        context: context,
        builder: (ctx, child) => ConfirmationDialog(
          title: widget.id != null
              ? transl.upsertMyCrop.updateCropProfile
              : transl.upsertMyCrop.title,
          content: widget.id != null
              ? transl.upsertMyCrop.carryOutPlantingDes
              : transl.upsertMyCrop.createCropDes,
          onTapOk: () async {
            final data = status == CropStatus.todo ? formData2 : formData;
            await upsertProvider.upsertMyCrop(data);
            if (mounted) {
              context.popRoute();
            }
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final isInsert = widget.id == null;
    final upsertMyCrop = ref.watch(upsertMyCropProvider(widget.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isInsert ? transl.upsertMyCrop.title : transl.myCropDetail.title,
        ),
      ),
      body: upsertMyCrop.when(
        initial: () => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (data, _) {
          myCrop = data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (!isInsert) ...[
                      MyCropOverview(myCrop: data),
                      const SizedBox(height: 16)
                    ],
                    FormBuilder(
                      key: formKey,
                      enabled:
                          isInsert ? true : data?.cropStatus == CropStatus.todo,
                      child: MyCropUpsertForm(initial: data),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: (data?.cropStatus != null)
                    ? () {
                        switch (data!.cropStatus!) {
                          case CropStatus.completed:
                            return const SizedBox();
                          case CropStatus.inprogress:
                            return ElevatedButton(
                              onPressed: () => handleCancelOrCompleted(
                                CropStatus.completed,
                              ),
                              child: Text(transl.myCrops.complete),
                            );
                          case CropStatus.todo:
                            return Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.neutral05,
                                    ),
                                    onPressed: () => handleCancelOrCompleted(
                                      CropStatus.cancel,
                                    ),
                                    child: Text(transl.myCrops.cancel),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.errorDefault,
                                    ),
                                    onPressed: () =>
                                        handleSubmit(CropStatus.todo),
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
              )
            ],
          );
        },
        error: (err) => Center(child: Text('${transl.error.error}: $err')),
      ),
      bottomNavigationBar: (isInsert)
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: handleReset,
                      child: Text(transl.common.button.reset),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => handleSubmit(null),
                      child: Text(transl.common.button.create),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
