import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<EventBus>(() => EventBus());
}
