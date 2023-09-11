import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../global/data/models/crop_type/crop_type.dart';
import '../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../global/enum/crop_status.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/widgets/shimmer/shimmer_text_field.dart';
import '../../../../../global/widgets/text_label.dart';
import '../../../selector/crop_selector.dart';
import '../../../selector/crop_type_selector.dart';
import '../../crops/providers/crop_type_provider.dart';
import '../modules/upsert/providers/crops_by_crop_type_provider.dart';
import 'crop_status_selector.dart';
import 'other_button_tile.dart';
import 'task_form.dart';

class MyCropUpsertForm extends ConsumerStatefulWidget {
  const MyCropUpsertForm({super.key, this.initial});

  final MyCrop? initial;

  @override
  ConsumerState<MyCropUpsertForm> createState() => _MyCropUpsertFormState();
}

class _MyCropUpsertFormState extends ConsumerState<MyCropUpsertForm> {
  var formCropKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final formBuilder = FormBuilder.of(context)!;
    final cropType = ref.watch(cropTypeProvider);
    final cropTypeId = formBuilder.fields['cropType']?.value != null
        ? ((formBuilder.fields['cropType']?.value) as CropType).uid
        : '';

    return Column(
      children: [
        if (widget.initial == null)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textlabel(label: transl.crops.cropTypes, paddingTop: 0),
                cropType.when(
                  initial: () => const SizedBox(),
                  loading: () => const ShimmerTextField(),
                  data: (data, _) {
                    return FormBuilderField(
                      name: 'cropType',
                      enabled: formBuilder.fields['other']?.value == true
                          ? false
                          : true,
                      validator: formBuilder.fields['other']?.value == true
                          ? null
                          : FormBuilderValidators.required(
                              errorText: transl.upsertMyCrop.cropType.required,
                            ),
                      builder: (field) {
                        return CropTypeSelector(
                          enabled: formBuilder.fields['other']?.value == true
                              ? false
                              : true,
                          items: data,
                          initial: data
                              .where((e) => e.uid == widget.initial?.cropTypeId)
                              .toList(),
                          hintText: transl.crops.selectCropType,
                          errorText: field.errorText,
                          onChanged: (cropType) {
                            if (cropType.isEmpty) return;
                            field.didChange(cropType.first.value);
                            formBuilder.fields['crop']?.reset();
                            setState(() {
                              formCropKey = GlobalKey();
                            });
                          },
                        );
                      },
                    );
                  },
                  error: (err) => Text('${transl.error.error}: $err'),
                ),
                FormBuilderField<bool>(
                  initialValue: widget.initial?.otherCropType,
                  name: 'other',
                  builder: (field) {
                    return OtherButtonTile(
                      onChanged: (value) {
                        field.didChange(value);
                        setState(() {});
                      },
                    );
                  },
                ),
                if (formBuilder.fields['other']?.value == true)
                  FormBuilderTextField(
                    name: 'otherCropType',
                    decoration: InputDecoration(
                      hintText: transl.upsertMyCrop.cropType.otherHint,
                      suffixIcon: const SizedBox.square(dimension: 40),
                    ),
                    valueTransformer: (String? value) => value!.trim(),
                  ),
                Textlabel(
                  label: transl.upsertMyCrop.crop.label,
                  paddingTop:
                      formBuilder.fields['other']?.value == true ? 12 : 0,
                ),
                if (formBuilder.fields['other']?.value == true)
                  FormBuilderTextField(
                    name: 'otherCropName',
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: transl.upsertMyCrop.crop.otherHint,
                      suffixIcon: const SizedBox.square(dimension: 40),
                    ),
                    valueTransformer: (String? value) => value!.trim(),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                          errorText: transl.upsertMyCrop.crop.required,
                        ),
                      ],
                    ),
                  )
                else
                  ref.watch(cropsByCropTypeProvider(cropTypeId)).when(
                        data: (data) {
                          return FormBuilderField(
                            key: formCropKey,
                            enabled:
                                formBuilder.fields['cropType']?.value != null,
                            validator:
                                formBuilder.fields['other']?.value == true
                                    ? null
                                    : FormBuilderValidators.required(
                                        errorText:
                                            transl.upsertMyCrop.crop.required,
                                      ),
                            name: 'crop',
                            builder: (field) {
                              return CropSelector(
                                enabled:
                                    formBuilder.fields['cropType']?.value !=
                                        null,
                                errorText: field.errorText,
                                items: data,
                                initial: data
                                    .where(
                                        (e) => e.uid == widget.initial?.cropId)
                                    .toList(),
                                hintText: transl.upsertMyCrop.crop.hint,
                                onChanged: (crop) {
                                  if (crop.isEmpty) return;
                                  field.didChange(crop.first.value);
                                },
                              );
                            },
                          );
                        },
                        error: (err, __) => Text('${transl.error.error}: $err'),
                        loading: () => const ShimmerTextField(),
                      ),
                Textlabel(label: transl.upsertMyCrop.initialStatus),
                FormBuilderField(
                  name: 'status',
                  initialValue: CropStatus.todo,
                  builder: (field) {
                    return CropStatusSelector(
                      unSelectedOptions: const [
                        CropStatus.completed,
                        CropStatus.cancel
                      ],
                      onChanged: (value) {
                        field.didChange(value);
                        setState(() {});
                      },
                    );
                  },
                )
              ],
            ),
          ),
        if (formBuilder.fields['status']?.value == CropStatus.inprogress)
          const TaskForm(),
      ],
    );
  }
}
