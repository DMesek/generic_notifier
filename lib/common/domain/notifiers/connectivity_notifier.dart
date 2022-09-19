import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityNotifier extends StateNotifier<ConnectivityResult?> {
  final Connectivity _connectivity;

  ConnectivityNotifier(this._connectivity) : super(null) {
    init();
  }

  void init() => _connectivity.onConnectivityChanged.listen((connectivityResult) {
        state = connectivityResult;
      });
}
