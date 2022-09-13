import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/main.dart';
import 'package:reusability/presentation/example_state_notifier.dart';

class ExamplePage extends ConsumerWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exampleNotifierProvider);
    return Scaffold(
      body: Center(
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
            TextButton(
              onPressed: ref.read(exampleNotifierProvider.notifier).getSomeString,
              child: const Text('Get string'),
            ),
            TextButton(
              onPressed: () => ref.read(exampleNotifierProvider.notifier).navigateToNamed(secondRoute),
              child: const Text('Navigate'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            // Within the SecondScreen widget
            onPressed: ref.read(exampleNotifierProvider.notifier).pop,
            child: const Text('Go back!'),
          ),
          TextButton(
            onPressed: () => ref.read(exampleNotifierProvider.notifier).navigateToNamed(thirdRoute),
            child: const Text('Navigate'),
          ),
        ],
      ),
    );
  }
}

class Screen3 extends ConsumerWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            // Within the SecondScreen widget
            onPressed: () {
              // Navigate back to the first screen by popping the current route
              // off the stack.
              ref.read(exampleNotifierProvider.notifier).pop();
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
