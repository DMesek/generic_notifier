import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/features/connectivity/domain/notifiers/connectivity_notifier.dart';

extension ConnectivityExtensions on WidgetRef {
  void globalConnectivityListener() {
    listen<ConnectivityResult?>(
      connectivityProvider,
      (previous, current) {
        if (current == ConnectivityResult.none && previous != null) {
          log('no connection');
        } else if (previous == ConnectivityResult.none &&
            (current == ConnectivityResult.mobile || current == ConnectivityResult.wifi)) {
          log('connection is back');
        }
      },
    );
  }
}
