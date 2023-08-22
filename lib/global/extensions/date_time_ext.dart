import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../gen/strings.g.dart';

extension DateTimeExtension on DateTime {
  String formatDateTime() {
    return '${(DateFormat.Hm('vi').format(this))} ${formatDate()}';
  }

  String formatDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String formatTime() {
    return '${DateFormat.Hm('vi').format(this)} ';
  }

  bool isSameDayOrAfter(DateTime other) => isAfter(other) || isSameDay(other);

  bool isSameDayOrBefore(DateTime other) => isBefore(other) || isSameDay(other);

  bool isSameDay(DateTime? other) =>
      other != null &&
      year == other.year &&
      month == other.month &&
      day == other.day;

  bool isBetweenDays(DateTime? start, DateTime? end) {
    var isAfterStartDay = start != null ? isSameDayOrAfter(start) : true;
    var isBeforeEndDay = end != null ? isSameDayOrBefore(end) : true;

    return isAfterStartDay && isBeforeEndDay;
  }

  bool isTimeBefore(DateTime other) =>
      hour < other.hour || (hour == other.hour && minute < other.minute);

  bool isSameTimeOrBefore(DateTime other) =>
      isTimeBefore(other) || (hour == other.hour && minute == other.minute);

  DateTime combineTime(DateTime other) =>
      DateTime(year, month, day, other.hour, other.minute, other.second);

  DateTime setTime([
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  ]) =>
      DateTime(
          year, month, day, hour, minute, second, millisecond, microsecond);

  String timeAgoCustom({
    required DateTime date,
    required BuildContext context,
  }) {
    final transl = Translations.of(context);

    final year = '${transl.common.dateTime.year} ${transl.common.dateTime.ago}';
    final month =
        '${transl.common.dateTime.month} ${transl.common.dateTime.ago}';
    final week = '${transl.common.dateTime.week} ${transl.common.dateTime.ago}';
    final hour = '${transl.common.dateTime.hour} ${transl.common.dateTime.ago}';
    final minute =
        '${transl.common.dateTime.minute} ${transl.common.dateTime.ago}';

    Duration diff = DateTime.now().difference(date);
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()} $year';
    }
    if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()} $month';
    }
    if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()} $week';
    }
    if (diff.inDays > 0) {
      return DateFormat.EEEE(LocaleSettings.currentLocale.languageCode)
          .add_jm()
          .format(date)
          .toString();
    }
    if (diff.inHours > 0) {
      return '${diff.inHours} $hour';
    }
    if (diff.inMinutes > 0) {
      return '${diff.inMinutes} $minute';
    }
    return transl.common.dateTime.justNow;
  }
}
