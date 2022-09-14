import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/router/base_router.dart';
import 'package:reusability/common/domain/router/beamer_locations.dart';

final baseRouterProvider = StateProvider<BaseRouter>((ref) {
  // final appRouter = AppRouter();
  // return AppRouterRouter(
  //   routerDelegate: appRouter.delegate(),
  //   routeInformationParser: appRouter.defaultRouteParser(),
  //   router: appRouter,
  // );
  // final goRouter = GoRouter(
  //   routes: <GoRoute>[
  //     GoRoute(
  //       path: ExamplePage.routeName,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ExamplePage();
  //       },
  //     ),
  //     GoRoute(
  //       path: ExamplePage2.routeName,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ExamplePage2();
  //       },
  //     ),
  //     GoRoute(
  //       path: ExamplePage3.routeName,
  //       builder: (BuildContext context, GoRouterState state) {
  //         return const ExamplePage3();
  //       },
  //     ),
  //   ],
  // );
  // return GoRouterRouter(
  //   routerDelegate: goRouter.routerDelegate,
  //   routeInformationParser: goRouter.routeInformationParser,
  //   routeInformationProvider: goRouter.routeInformationProvider,
  //   router: goRouter,
  // );
  return BeamerRouter(
    routerDelegate: BeamerDelegate(
      initialPath: '/',
      locationBuilder: (routeInformation, _) => BeamerLocations(routeInformation),
    ),
    routeInformationParser: BeamerParser(),
  );
});
