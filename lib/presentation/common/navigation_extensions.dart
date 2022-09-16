// ignore_for_file: always_use_package_imports

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/notifiers/navigation_provider.dart';
import '../../domain/notifiers/route_action.dart';

extension NavigationExtensions on WidgetRef {
  void pop() => read(globalNavigationProvider.notifier).update((_) => PopAction());
  void pushNamed(String routeName) => read(globalNavigationProvider.notifier).update((_) => PushNamedAction(routeName));
  void pushReplacementNamed(String routeName) =>
      read(globalNavigationProvider.notifier).update((_) => PushReplacementNamedAction(routeName));
}
