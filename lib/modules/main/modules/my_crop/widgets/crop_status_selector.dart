import 'package:flutter/material.dart';

import '../../../../../global/enum/crop_status.dart';
import '../../../../../global/themes/app_colors.dart';

class CropStatusSelector extends StatefulWidget {
  const CropStatusSelector({
    super.key,
    this.onChanged,
    this.unSelectedOptions,
  });

  final List<CropStatus>? unSelectedOptions;
  final void Function(CropStatus)? onChanged;

  @override
  State<CropStatusSelector> createState() => _CropStatusSelectorState();
}

class _CropStatusSelectorState extends State<CropStatusSelector> {
  CropStatus selectedStatus = CropStatus.todo;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Wrap(
      spacing: 16,
      runSpacing: 10,
      children: CropStatus.values.map((e) {
        bool enabled = selectedStatus == e;
        bool disabled = (widget.unSelectedOptions ?? []).contains(e);
        return GestureDetector(
          onTap: disabled
              ? null
              : () {
                  setState(() {
                    selectedStatus = e;
                  });
                  widget.onChanged?.call(e);
                },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: enabled ? AppColors.successSoft : AppColors.neutral07,
            ),
            child: Text(
              e.statusTitle(context),
              style: textTheme.titleSmall?.copyWith(
                color: disabled
                    ? AppColors.neutral04
                    : enabled
                        ? AppColors.primary
                        : null,
                fontWeight: enabled ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
