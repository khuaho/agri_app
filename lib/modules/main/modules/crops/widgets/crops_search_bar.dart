import 'package:flutter/material.dart';

import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/widgets/filter/filter_text_field.dart';
import '../model/crop_filter_data.dart';
import 'crops_filter_sheet.dart';

class CropsSearchBar extends StatefulWidget {
  const CropsSearchBar({
    super.key,
    required this.onChanged,
    required this.initialFilter,
  });

  final ValueChanged<String> onChanged;
  final CropFilterData initialFilter;

  @override
  State<CropsSearchBar> createState() => _CropsSearchBarState();
}

class _CropsSearchBarState extends State<CropsSearchBar> {
  late CropFilterData filter = widget.initialFilter;
  void handleFilter(CropFilterData filterData) {
    filter = filterData;
    final newFilters = [];
    // filter by keyboard
    if (filterData.keyword?.isNotEmpty ?? false) {
      newFilters.add(filterData.keyword);
    }

    widget.onChanged(filterData.keyword ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: FilterTextField(
            hintText: transl.crops.searchCrop,
            onTextChange: (text) => handleFilter(
              filter.copyWith(keyword: text),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Material(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.hardEdge,
          color: Theme.of(context).canvasColor,
          child: IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CropFilterSheet(initialFilters: filter),
                  ),
                ),
              );

              // if (newFilter is CropFilterData) {
              //   handleFilter(newFilter);
              // }
            },
            icon: const Icon(
              Icons.filter_list,
              color: AppColors.neutral03,
              size: 16,
            ),
            hoverColor: AppColors.neutral09,
          ),
        ),
      ],
    );
  }
}
