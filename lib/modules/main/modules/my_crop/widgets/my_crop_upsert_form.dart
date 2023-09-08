import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/widgets/shimmer/shimmer_text_field.dart';
import '../../../../../global/widgets/text_label.dart';
import '../../../selector/crop_selector.dart';
import '../../../selector/crop_type_selector.dart';
import '../../crops/providers/crop_provider.dart';
import '../../crops/providers/crop_type_provider.dart';
import 'other_button_tile.dart';

class MyCropUpsertForm extends ConsumerStatefulWidget {
  const MyCropUpsertForm({super.key, this.initial});

  final MyCrop? initial;

  @override
  ConsumerState<MyCropUpsertForm> createState() => _MyCropUpsertFormState();
}

class _MyCropUpsertFormState extends ConsumerState<MyCropUpsertForm> {
  var formCropTypeKey = GlobalKey();
  var formCropKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final formBuilder = FormBuilder.of(context)!;
    final cropType = ref.watch(cropTypeProvider);
    final asyncCrops = ref.watch(asyncCropsProvider);

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
                      key: formCropTypeKey,
                      name: 'cropType',
                      enabled: formBuilder.fields['other']?.value == true
                          ? false
                          : true,
                      validator: FormBuilderValidators.required(
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
                            setState(() {});
                          },
                        );
                      },
                    );
                  },
                  error: (err) => Text('${transl.error.error}: $err'),
                ),
                FormBuilderField<bool>(
                  name: 'other',
                  builder: (field) {
                    return OtherButtonTile(
                      onChanged: (value) {
                        field.didChange(value);
                        setState(() {});
                        // formBuilder.fields['cropType']?.reset();
                        // formBuilder.fields['cropName']?.reset();
                        // formBuilder.fields['otherCropName']?.reset();
                        // formBuilder.fields['cropName']?.reset();
                        // formCropTypeKey = GlobalKey();
                        // formCropKey = GlobalKey();
                        // setState(() {});
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
                  asyncCrops.when(
                    data: (data) {
                      return FormBuilderField(
                        key: formCropKey,
                        enabled: formBuilder.fields['cropType']?.value != null,
                        validator: FormBuilderValidators.required(
                          errorText: transl.upsertMyCrop.crop.required,
                        ),
                        name: 'cropName',
                        builder: (field) {
                          return CropSelector(
                            enabled:
                                formBuilder.fields['cropType']?.value != null,
                            errorText: field.errorText,
                            items: data,
                            initial: data
                                .where((e) => e.uid == widget.initial?.cropId)
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
              ],
            ),
          ),
      ],
    );
  }
}
