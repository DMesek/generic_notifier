import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/example_state_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ExamplePage(),
      ),
    );
  }
}

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
                errorOccured: (failure) => failure.toString(),
              ),
            ),
            MaterialButton(
              onPressed: () =>
                  ref.read(exampleNotifierProvider.notifier).getSomeString(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(exampleNotifierProvider.notifier).getSomeOtherString(),
      ),
    );
  }
}
