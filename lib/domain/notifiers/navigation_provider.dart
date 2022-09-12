import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/notifiers/navigation_state.dart';

final navigationProvider = StateProvider.autoDispose<NavigationState>(
  (_) => const NavigationState.initial(),
);
