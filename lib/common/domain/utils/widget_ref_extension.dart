import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/failure.dart';
import 'package:reusability/domain/notifiers/navigation_provider.dart';
import 'package:reusability/domain/notifiers/route_action.dart';
import 'package:reusability/presentation/common/base_state_notifier.dart';

extension WidgetRefExtension on WidgetRef {
  void globalFailureListener(BuildContext _) {
    listen<Failure?>(globalFailureProvider, (_, failure) {
      if (failure == null) return;
      log('showing ${failure.isCritical ? '' : 'non-'}critical failure with title ${failure.title}, error: ${failure.error} \nand stackTrace: ${failure.stackTrace}');
    });
  }

  void globalNavigationListener(BuildContext context) {
    listen<RouteAction?>(
      navigationProvider,
      (_, state) => state?.execute(context),
    );
  }
}
