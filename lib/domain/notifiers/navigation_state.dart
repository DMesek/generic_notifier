import 'package:build_context/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _Initial;

  const factory NavigationState.routing({
    String? routeName,
    @Default(RouteFunction.pushNamed) RouteFunction routeFunction,
  }) = _Routing;
}

enum RouteFunction { pushNamed, pop }

extension RouteFunctionActions on RouteFunction {
  void routeAction(BuildContext context, {String? routeName}) {
    switch (this) {
      case RouteFunction.pushNamed:
        context.pushNamed(routeName ?? '');
        break;
      case RouteFunction.pop:
        context.pop();
        break;
    }
  }
}
