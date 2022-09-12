import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/presentation/common/base_scaffold.dart';
import 'package:reusability/presentation/example_state_notifier.dart';

class ExamplePage extends ConsumerWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exampleNotifierProvider);
    return BaseScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              state.when(
                data: (sentence) => sentence,
                loading: () => 'Loading',
                other: (_) => 'Other',
                initial: () => 'Initial',
                error: (failure) => failure.toString(),
              ),
            ),
            MaterialButton(
              onPressed: () => ref.read(exampleNotifierProvider.notifier).getSomeString(),
            ),
          ],
        ),
      ),
    );
  }
}
