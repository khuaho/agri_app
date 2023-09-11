import 'package:adaptive_selector/adaptive_selector.dart';
import 'package:flutter/material.dart';

import '../../../global/data/models/crop_type/crop_type.dart';
import '../../../global/gen/strings.g.dart';

extension CropTypeExt on CropType {
  AdaptiveSelectorOption<CropType> get option => AdaptiveSelectorOption(
        id: uid,
        label: LocaleSettings.currentLocale == AppLocale.en
            ? nameEn ?? '_'
            : nameVi ?? '_',
        value: this,
      );
}

class CropTypeSelector extends StatefulWidget {
  const CropTypeSelector({
    Key? key,
    this.onChanged,
    this.errorText,
    required this.initial,
    this.isMultiple = false,
    this.enabled = true,
    this.hintText,
    this.excludeIds,
    this.allowClear = true,
    required this.items,
  }) : super(key: key);

  final List<CropType> initial;
  final List<String>? excludeIds;
  final void Function(
    List<AdaptiveSelectorOption<CropType>> options,
  )? onChanged;
  final String? errorText;
  final String? hintText;
  final bool isMultiple;
  final bool enabled;
  final bool allowClear;
  final List<CropType> items;

  @override
  State<CropTypeSelector> createState() => _CropTypeSelectorState();
}

class _CropTypeSelectorState extends State<CropTypeSelector> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final initialOptions = widget.initial.map((e) => e.option).toList();
    List<AdaptiveSelectorOption<CropType>>? options =
        widget.items.map((e) => e.option).toList();

    return AdaptiveSelector(
      options: options,
      enable: widget.enabled,
      type: SelectorType.menu,
      initial: initialOptions,
      isMultiple: widget.isMultiple,
      loading: loading,
      allowClear: widget.allowClear,
      refreshWhenShow: true,
      decoration: InputDecoration(
        errorText: widget.errorText,
        hintText: initialOptions.isEmpty ? widget.hintText : null,
      ),
      onChanged: widget.onChanged?.call,
      onSearch: (keyword) async {},
    );
  }
}
