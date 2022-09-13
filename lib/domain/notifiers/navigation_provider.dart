import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/notifiers/route_action.dart';

final navigationProvider = StateProvider.autoDispose<RouteAction?>(
  (_) => null,
);
