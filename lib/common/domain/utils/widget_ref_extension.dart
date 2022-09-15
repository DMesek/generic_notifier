import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/router/base_router.dart';
import 'package:reusability/domain/failure.dart';
import 'package:reusability/domain/notifiers/global_failure_provider.dart';
import 'package:reusability/domain/notifiers/navigation_provider.dart';
import 'package:reusability/domain/notifiers/route_action.dart';

extension WidgetRefExtension on WidgetRef {
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

  void globalNavigationListener(BaseRouter baseRouter) {
    listen<RouteAction?>(
      globalNavigationProvider,
      (_, state) => state?.execute(baseRouter),
    );
  }
}
