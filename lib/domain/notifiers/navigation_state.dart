import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.initial() = _Initial;

  const factory NavigationState.routing({
    String? routeName,
    @Default(RouteType.pushNamed) RouteType routeFunction,
  }) = _Routing;
}

enum RouteType { pushNamed, pop }

extension RouteTypeActions on RouteType {
  void routeAction(BuildContext context, {String? routeName}) {
    switch (this) {
      case RouteType.pushNamed:
        context.beamToNamed(routeName ?? '');
        break;
      case RouteType.pop:
        context.beamBack();
        break;
    }
  }
}
