import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/notifiers/connectivity_notifier.dart';

final connectivityProvider = StateNotifierProvider<ConnectivityNotifier, ConnectivityResult?>(
  (ref) => ConnectivityNotifier(Connectivity()),
);
