import 'package:adaptive_selector/adaptive_selector.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/models/crop_type/crop_type.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/utils/riverpod/app_state.dart';
import '../../../../../global/widgets/filter/filter_sheet_wrapper.dart';
import '../../../../../global/widgets/loading_overlay.dart';
import '../../../selector/crop_type_selector.dart';
import '../model/crop_filter_data.dart';
import '../providers/crop_type_provider.dart';

class CropFilterSheet extends ConsumerStatefulWidget {
  const CropFilterSheet({super.key, required this.initialFilters});

  final CropFilterData initialFilters;

  @override
  ConsumerState<CropFilterSheet> createState() => _CropFilterSheetState();
}

class _CropFilterSheetState extends ConsumerState<CropFilterSheet> {
  late CropFilterData filter = widget.initialFilters;
  var formKey = GlobalKey();

  void handleClearFilter() {
    setState(() {
      filter = const CropFilterData();
      formKey = GlobalKey();
    });
  }

  void onCropTypeSelectionComplete(
      List<AdaptiveSelectorOption<CropType>> cropType) {
    if (cropType.isEmpty) return;
    setState(() {
      filter = filter.copyWith(
        cropType: cropType.first.id,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(cropTypeProvider);

    return LoadingOverlay(
      loading: state.isLoading,
      child: FilterSheetWrapper(
        key: formKey,
        onClearAll: handleClearFilter,
        onApply: () => AutoRouter.of(context).pop(filter),
        children: [
          Text(
            transl.crops.cropTypes,
            style: textTheme.titleSmall?.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          CropTypeSelector(
            items: state.data ?? [],
            initial:
                state.data?.where((e) => e.id == filter.cropType).toList() ??
                    [],
            hintText: transl.crops.selectCropType,
            onChanged: onCropTypeSelectionComplete,
          ),
        ],
      ),
    );
  }
}
