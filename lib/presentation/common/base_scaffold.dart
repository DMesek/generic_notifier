import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/failure.dart';
import '../example_state_notifier.dart';
import 'base_loading_indicator.dart';
import 'base_state_notifier.dart';

class BaseScaffold extends ConsumerWidget {
  final Widget child;

  const BaseScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<Failure?>(globalFailureProvider, (_, failure) {
      if (failure == null) return;
      log('showing failure with title ${failure.title}, error: ${failure.error} \nand stackTrace: ${failure.stackTrace}');
    });
    final showLoading = ref.watch(globalLoadingProvider);
    return Stack(
      children: [
        Scaffold(
          body: child,
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                ref.read(exampleNotifierProvider.notifier).getSomeString(),
          ),
        ),
        if (showLoading) const BaseLoadingIndicator(),
      ],
    );
  }
}
