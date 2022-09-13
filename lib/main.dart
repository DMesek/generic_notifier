import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/router/beamer_locations.dart';
import 'package:reusability/main/custom_provider_observer.dart';
import 'package:reusability/presentation/common/base_scaffold.dart';

void main() {
  runApp(ProviderScope(observers: [CustomProviderObserver()], child: MyApp()));
}

// final goRouterDelegateProvider = StateProvider<GoRouter>((ref) {
//   return GoRouter(
//     routes: <GoRoute>[
//       GoRoute(
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) {
//           return const ExamplePage();
//         },
//       ),
//       GoRoute(
//         path: secondRoute,
//         builder: (BuildContext context, GoRouterState state) {
//           return const SecondScreen();
//         },
//       ),
//       GoRoute(
//         path: thirdRoute,
//         builder: (BuildContext context, GoRouterState state) {
//           return const Screen3();
//         },
//       ),
//     ],
//   );
// });

const secondRoute = '/second';
const thirdRoute = '/third';

class MyApp extends ConsumerWidget {
  final routerDelegate = BeamerDelegate(
    initialPath: '/',
    locationBuilder: (routeInformation, _) => BeamerLocations(routeInformation),
  );

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appRouter = ref.read(appRouterProvider);
    // final goRouter = ref.read(goRouterDelegateProvider);
    return BeamerProvider(
      routerDelegate: routerDelegate,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        // routerDelegate: goRouter.routerDelegate,
        // routeInformationParser: goRouter.routeInformationParser,
        // routeInformationProvider: goRouter.routeInformationProvider,
        // routerDelegate: appRouter?.delegate(),
        // routeInformationParser: appRouter?.defaultRouteParser(),
        builder: (context, child) => BaseScaffold(child: child ?? const SizedBox()),
      ),
    );
  }
}
