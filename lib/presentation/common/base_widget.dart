// ignore_for_file: always_use_package_imports

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/domain/router/base_router_provider.dart';
import '../../domain/failure.dart';
import '../../domain/notifiers/global_failure_provider.dart';
import '../../domain/notifiers/global_loading_provider.dart';
import '../../domain/notifiers/navigation_provider.dart';
import '../../domain/notifiers/route_action.dart';
import 'base_loading_indicator.dart';

class BaseWidget extends ConsumerWidget {
  final Widget child;

  const BaseWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.globalFailureListener(context);
    ref.globalNavigationListener();
    final showLoading = ref.watch(globalLoadingProvider);
    return Stack(
      children: [
        child,
        if (showLoading) const BaseLoadingIndicator(),
      ],
    );
  }
}

extension _WidgetRefExtensions on WidgetRef {
  void globalFailureListener(BuildContext _) {
    listen<Failure?>(globalFailureProvider, (_, failure) {
      if (failure == null) return;
      //Show global error
      log('''showing ${failure.isCritical ? '' : 'non-'}critical failure with title ${failure.title},
          error: ${failure.error},
          stackTrace: ${failure.stackTrace}
      ''');
    });
  }

  void globalNavigationListener() {
    listen<RouteAction?>(
      globalNavigationProvider,
      (_, state) => state?.execute(read(baseRouterProvider)),
    );
  }
}
