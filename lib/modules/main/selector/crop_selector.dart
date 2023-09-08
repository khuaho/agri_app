import 'package:adaptive_selector/adaptive_selector.dart';
import 'package:flutter/material.dart';

import '../../../global/data/models/crop/crop.dart';
import '../../../global/gen/strings.g.dart';

extension CropExt on Crop {
  AdaptiveSelectorOption<Crop> get option => AdaptiveSelectorOption(
        id: uid,
        label: LocaleSettings.currentLocale == AppLocale.en
            ? nameEn ?? '_'
            : nameVi ?? '_',
        value: this,
      );
}

class CropSelector extends StatefulWidget {
  const CropSelector({
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

  final List<Crop> initial;
  final List<String>? excludeIds;
  final void Function(
    List<AdaptiveSelectorOption<Crop>> options,
  )? onChanged;
  final String? errorText;
  final String? hintText;
  final bool isMultiple;
  final bool enabled;
  final bool allowClear;
  final List<Crop> items;

  @override
  State<CropSelector> createState() => _CropTypeSelectorState();
}

class _CropTypeSelectorState extends State<CropSelector> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final initialOptions = widget.initial.map((e) => e.option).toList();
    List<AdaptiveSelectorOption<Crop>>? options =
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
        hintText: widget.hintText,
      ),
      onChanged: widget.onChanged?.call,
      onSearch: (keyword) async {},
    );
  }
}
