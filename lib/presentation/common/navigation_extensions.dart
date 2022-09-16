import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/notifiers/navigation_provider.dart';
import 'package:reusability/domain/notifiers/route_action.dart';

extension NavigationExtensions on WidgetRef {
  void pop() =>
      read(globalNavigationProvider.notifier).update((_) => PopAction());
  void pushNamed(String routeName) => read(globalNavigationProvider.notifier)
      .update((_) => PushNamedAction(routeName));
  void pushReplacementNamed(String routeName) =>
      read(globalNavigationProvider.notifier)
          .update((_) => PushReplacementNamedAction(routeName));
}
