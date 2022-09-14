import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/notifiers/route_action.dart';

final globalNavigationProvider = StateProvider.autoDispose<RouteAction?>(
  (_) => null,
);
