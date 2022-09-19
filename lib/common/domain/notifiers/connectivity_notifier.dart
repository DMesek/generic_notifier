import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityNotifier extends StateNotifier<ConnectivityResult?> {
  ConnectivityNotifier() : super(null) {
    init();
  }

  void init() => Connectivity().onConnectivityChanged.listen((connectivityResult) {
        state = connectivityResult;
      });
}
