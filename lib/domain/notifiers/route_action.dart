import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/router/beamer_delegate_provider.dart';

abstract class RouteAction {
  final String routeName;
  RouteAction([this.routeName = '']);

  void execute(Reader reader);
}

class RouteActionPushNamed extends RouteAction {
  RouteActionPushNamed(super.routeName);

  @override
  void execute(Reader reader) => reader(beamerDelegateProvider)?.beamToNamed(routeName);
}

class RouteActionPop extends RouteAction {
  @override
  void execute(Reader reader) => reader(beamerDelegateProvider)?.beamBack();
}

class RouteActionPushReplacement extends RouteAction {
  RouteActionPushReplacement(super.routeName);

  @override
  void execute(Reader reader) => reader(beamerDelegateProvider)?.beamToReplacementNamed(routeName);
}
