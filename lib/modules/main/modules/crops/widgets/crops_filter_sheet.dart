import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../global/widgets/filter/filter_sheet_wrapper.dart';
import '../model/crop_filter_data.dart';

class CropFilterSheet extends StatefulWidget {
  const CropFilterSheet({super.key, required this.initialFilters});

  final CropFilterData initialFilters;

  @override
  State<CropFilterSheet> createState() => _CropFilterSheetState();
}

class _CropFilterSheetState extends State<CropFilterSheet> {
  late CropFilterData filter = widget.initialFilters;
  var formKey = GlobalKey();

  void handleClearFilter() {
    setState(() {
      filter = const CropFilterData();
      formKey = GlobalKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FilterSheetWrapper(
      key: formKey,
      onClearAll: handleClearFilter,
      onApply: () => AutoRouter.of(context).pop(filter),
      children: const [
        Text('Hello'),
      ],
    );
  }
}
