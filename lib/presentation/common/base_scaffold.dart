import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/utils/widget_ref_extension.dart';
import 'package:reusability/presentation/common/base_loading_indicator.dart';
import 'package:reusability/presentation/common/base_state_notifier.dart';
import 'package:reusability/presentation/example_state_notifier.dart';

class BaseScaffold extends ConsumerWidget {
  final Widget? child;

  const BaseScaffold({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.globalFailureListener(context);
    ref.globalNavigationListener(context);
    final showLoading = ref.watch(globalLoadingProvider);
    return Stack(
      children: [
        Scaffold(
          body: child,
          floatingActionButton: FloatingActionButton(
            onPressed: () => ref.read(exampleNotifierProvider.notifier).getSomeString(),
          ),
        ),
        if (showLoading) const BaseLoadingIndicator(),
      ],
    );
  }
}
