import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.freezed.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.updateUser() = UpdateUserEvent;
  const factory AppEvent.createMyCrop() = CreateMyCropEvent;
  const factory AppEvent.changeLanguage() = ChangeLanguageEvent;
  const factory AppEvent.upsertNotification() = UpsertNotificationEvent;
}
