import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic value) {
    if (value is Timestamp) {
      return value.toDate();
    }
    return DateTime.fromMicrosecondsSinceEpoch(value);
  }

  @override
  Timestamp toJson(DateTime value) => Timestamp.fromDate(value);
}

class TimestampOrNullConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampOrNullConverter();

  @override
  DateTime? fromJson(dynamic value) {
    if (value is Timestamp) {
      return value.toDate();
    }
    if (value is int) {
      return DateTime.fromMicrosecondsSinceEpoch(value);
    }
    return null;
  }

  @override
  Timestamp? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}
