import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop_filter_data.freezed.dart';

@freezed
class CropFilterData with _$CropFilterData {
  const factory CropFilterData([
    String? keyword,
  ]) = _CropFilterData;
}
