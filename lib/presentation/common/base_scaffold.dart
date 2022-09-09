import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/presentation/common/base_loading_indicator.dart';
import 'package:reusability/presentation/common/base_state_notifier.dart';
import 'package:reusability/presentation/example_state_notifier.dart';

class BaseScaffold extends ConsumerWidget {
  final Widget child;

  const BaseScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLoading = ref.watch(loadingProvider);
    return Stack(
      children: [
        Scaffold(
          body: child,
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                ref.read(exampleNotifierProvider.notifier).getSomeOtherString(),
          ),
        ),
        if (showLoading) const BaseLoadingIndicator(),
      ],
    );
  }
}
