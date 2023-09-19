import 'package:event_bus/event_bus.dart';

import '../../locator.dart';

mixin AppMixin {
  final eventBus = locator.get<EventBus>();
}
