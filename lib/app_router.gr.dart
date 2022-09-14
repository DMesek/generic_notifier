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
    SecondScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SecondScreen());
    },
    Screen3Route.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const Screen3());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(ExamplePageRoute.name, path: '/'),
        RouteConfig(SecondScreenRoute.name, path: '/second'),
        RouteConfig(Screen3Route.name, path: '/second/third')
      ];
}

/// generated route for
/// [ExamplePage]
class ExamplePageRoute extends PageRouteInfo<void> {
  const ExamplePageRoute() : super(ExamplePageRoute.name, path: '/');

  static const String name = 'ExamplePageRoute';
}

/// generated route for
/// [SecondScreen]
class SecondScreenRoute extends PageRouteInfo<void> {
  const SecondScreenRoute() : super(SecondScreenRoute.name, path: '/second');

  static const String name = 'SecondScreenRoute';
}

/// generated route for
/// [Screen3]
class Screen3Route extends PageRouteInfo<void> {
  const Screen3Route() : super(Screen3Route.name, path: '/second/third');

  static const String name = 'Screen3Route';
}
