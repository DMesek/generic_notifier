import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';

abstract class RouteAction {
  void execute(BuildContext context);
}

abstract class RouteName {
  final String routeName = '';
}

class RouteActionPushedNamed implements RouteAction, RouteName {
  @override
  final String routeName;

  RouteActionPushedNamed(this.routeName);

  @override
  void execute(BuildContext context) => context.beamToNamed(routeName);
}

class RouteActionPop implements RouteAction {
  @override
  void execute(BuildContext context) => context.beamBack();
}

class RouteActionPushedReplacement implements RouteAction, RouteName {
  @override
  final String routeName;

  RouteActionPushedReplacement(this.routeName);

  @override
  void execute(BuildContext context) =>
      context.beamToReplacementNamed(routeName);
}
