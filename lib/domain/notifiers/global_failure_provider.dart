// ignore_for_file: always_use_package_imports

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../failure.dart';

///[globalFailureProvider] can be used to show the failure without updating [BaseStateNotifier] state.
///
///The entire app is wrapped in [BaseWidget] which listens to this provider and failure can be shown above entire
///app by simply setting [globalFailure] to true when calling [BaseStateNotifier.execute] method.
final globalFailureProvider = StateProvider<Failure?>((_) => null);
