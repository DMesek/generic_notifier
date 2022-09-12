import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/notifiers/navigation_provider.dart';
import 'package:reusability/domain/notifiers/navigation_state.dart';

class AppNavigation {
  final WidgetRef ref;
  final BuildContext context;

  AppNavigation(this.ref, this.context);

  void initAppNavigation() {
    ref.listen<NavigationState>(
      navigationProvider,
      (_, state) {
        state.whenOrNull(routing: (routeName, routeFunction) {
          log('Routing to: $routeName');
          routeFunction.routeAction(context, routeName: routeName);
          ref.read(navigationProvider.notifier).update(
                (state) => const NavigationState.initial(),
              );
        });
      },
    );
  }
}
