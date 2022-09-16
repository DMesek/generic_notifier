import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

abstract class BaseRouter {
  RouterDelegate<Object> routerDelegate;
  RouteInformationParser<Object> routeInformationParser;
  RouteInformationProvider? routeInformationProvider;
  dynamic router;

  BaseRouter({
    required this.routerDelegate,
    required this.routeInformationParser,
    this.routeInformationProvider,
    this.router,
  });

  void pushNamed(String routeName);

  void pop();

  void pushReplacementNamed(String routeName);
}

class BeamerRouter extends BaseRouter {
  BeamerRouter({
    required super.routerDelegate,
    required super.routeInformationParser,
  });

  @override
  void pop() {
    (routerDelegate as BeamerDelegate).beamBack();
  }

  @override
  void pushNamed(String routeName) {
    (routerDelegate as BeamerDelegate).beamToNamed(routeName);
  }

  @override
  void pushReplacementNamed(String routeName) {
    (routerDelegate as BeamerDelegate).beamToReplacementNamed(routeName);
  }
}

// class AppRouterRouter extends BaseRouter {
//   AppRouterRouter({required super.routerDelegate, required super.routeInformationParser, super.router});
//
//   @override
//   void pop() {
//     (router as AppRouter).pop();
//   }
//
//   @override
//   void pushNamed(String routeName) {
//     (router as AppRouter).pushNamed(routeName);
//   }
//
//   @override
//   void pushReplacementNamed(String routeName) {
//     (router as AppRouter).replaceNamed(routeName);
//   }
// }
//
// class GoRouterRouter extends BaseRouter {
//   GoRouterRouter({
//     required super.routerDelegate,
//     required super.routeInformationParser,
//     super.routeInformationProvider,
//     super.router,
//   });
//
//   @override
//   void pop() {
//     (router as GoRouter).pop();
//   }
//
//   @override
//   void pushNamed(String routeName) {
//     (router as GoRouter).push(routeName);
//   }
//
//   @override
//   void pushReplacementNamed(String routeName) {
//     (router as GoRouter).replace(routeName);
//   }
// }
