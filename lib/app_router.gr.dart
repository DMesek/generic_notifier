// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ExamplePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ExamplePage());
    },
    ExamplePage2Route.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ExamplePage2());
    },
    ExamplePage3Route.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ExamplePage3());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(ExamplePageRoute.name, path: '/'),
        RouteConfig(ExamplePage2Route.name, path: '/page2'),
        RouteConfig(ExamplePage3Route.name, path: '/page2/page3')
      ];
}

/// generated route for
/// [ExamplePage]
class ExamplePageRoute extends PageRouteInfo<void> {
  const ExamplePageRoute() : super(ExamplePageRoute.name, path: '/');

  static const String name = 'ExamplePageRoute';
}

/// generated route for
/// [ExamplePage2]
class ExamplePage2Route extends PageRouteInfo<void> {
  const ExamplePage2Route() : super(ExamplePage2Route.name, path: '/page2');

  static const String name = 'ExamplePage2Route';
}

/// generated route for
/// [ExamplePage3]
class ExamplePage3Route extends PageRouteInfo<void> {
  const ExamplePage3Route()
      : super(ExamplePage3Route.name, path: '/page2/page3');

  static const String name = 'ExamplePage3Route';
}
