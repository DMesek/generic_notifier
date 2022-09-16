// ignore_for_file: always_use_package_imports

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/route_action.dart';

final globalNavigationProvider = StateProvider.autoDispose<RouteAction?>(
  (_) => null,
);
