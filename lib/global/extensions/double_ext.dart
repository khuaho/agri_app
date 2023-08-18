import 'package:intl/intl.dart';

extension DoubleExt on double {
  String toStringWithNoZero() {
    return toStringAsFixed(this == toInt() ? 0 : 1);
  }

  String toStringLimitFractionDigits([int digits = 2]) {
    var format = '##0';
    if (digits > 0) {
      format += '.';
      format += List.generate(digits, (_) => '#').join();
    }
    return NumberFormat(format, 'en').format(this);
  }
}
