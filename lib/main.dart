// ignore_for_file: always_use_package_imports

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/domain/providers/base_router_provider.dart';
import 'common/presentation/base_widget.dart';
import 'common/utils/custom_provider_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    observers: [CustomProviderObserver()],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseRouter = ref.read(baseRouterProvider);
    return BeamerProvider(
      routerDelegate: baseRouter.routerDelegate as BeamerDelegate,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerDelegate: baseRouter.routerDelegate,
        routeInformationParser: baseRouter.routeInformationParser,
        routeInformationProvider: baseRouter.routeInformationProvider,
        builder: (context, child) => BaseWidget(child: child ?? const SizedBox()),
      ),
    );
  }
}
