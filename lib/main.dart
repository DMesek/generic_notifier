import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/router/beamer_delegate_provider.dart';
import 'package:reusability/common/domain/router/beamer_locations.dart';
import 'package:reusability/main/custom_provider_observer.dart';
import 'package:reusability/presentation/common/base_widget.dart';

void main() {
  runApp(ProviderScope(observers: [CustomProviderObserver()], child: MyApp()));
}

class MyApp extends ConsumerWidget {
  final routerDelegate = BeamerDelegate(
    initialPath: '/',
    locationBuilder: (routeInformation, _) => BeamerLocations(routeInformation),
  );

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BeamerProvider(
      routerDelegate: routerDelegate,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        builder: (context, child) {
          ref.read(beamerDelegateProvider.notifier).update((state) => Beamer.of(context));
          return BaseWidget(child: child ?? const SizedBox());
        },
      ),
    );
  }
}
