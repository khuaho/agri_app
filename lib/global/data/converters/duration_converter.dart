import 'package:json_annotation/json_annotation.dart';

class DurationOrNullConverter implements JsonConverter<Duration?, int?> {
  const DurationOrNullConverter();

  @override
  Duration? fromJson(int? seconds) {
    return seconds == null ? null : Duration(seconds: seconds);
  }

  @override
  int? toJson(Duration? duration) => duration?.inSeconds;
}
