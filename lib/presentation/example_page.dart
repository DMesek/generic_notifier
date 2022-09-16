import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/presentation/common/navigation_extensions.dart';
import 'package:reusability/presentation/example_state_notifier.dart';

class ExamplePage extends ConsumerWidget {
  static const routeName = '/';

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
                other: (otherState) => otherState.when(
                  empty: () => 'Empty',
                  fetching: () => 'Fetching',
                  customError: (error) => 'Custom error: ${error.title}',
                ),
                initial: () => 'Initial',
                error: (failure) => failure.toString(),
              ),
            ),
            TextButton(
              onPressed: ref
                  .read(exampleNotifierProvider.notifier)
                  .getSomeStringWithOtherState,
              child: const Text('Other state example'),
            ),
            TextButton(
              onPressed:
                  ref.read(exampleNotifierProvider.notifier).getSomeString,
              child: const Text('Get string'),
            ),
            TextButton(
              onPressed: () => ref.pushNamed(ExamplePage2.routeName),
              child: const Text('Navigate'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamplePage2 extends ConsumerStatefulWidget {
  static const routeName = '/page2';

  const ExamplePage2({super.key});

  @override
  ConsumerState<ExamplePage2> createState() => _ExamplePage2State();
}

class _ExamplePage2State extends ConsumerState<ExamplePage2>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            // Within the SecondScreen widget
            onPressed: ref.pop,
            child: const Text('Go back!'),
          ),
          TextButton(
            onPressed: () => ref.pushNamed(ExamplePage3.routeName),
            child: const Text('Navigate'),
          ),
        ],
      ),
    );
  }
}

class ExamplePage3 extends ConsumerWidget {
  static const routeName = '${ExamplePage2.routeName}/page3';

  const ExamplePage3({super.key});

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
              ref.pop();
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
