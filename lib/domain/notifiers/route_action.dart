import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/router/beamer_delegate_provider.dart';

abstract class RouteAction {
  final String routeName;

  RouteAction([this.routeName = '']);

  void execute(Reader reader);
}

class RouteActionPushNamed extends RouteAction {
  RouteActionPushNamed(super.routeName);

  ///Replace it with the package action which is used in the app
  ///Beamer: reader(beamerDelegateProvider)?.beamToNamed(routeName);
  ///Auto route: reader(appRouterProvider)?.pushNamed(routeName);
  @override
  void execute(Reader reader) => reader(beamerDelegateProvider)?.beamToNamed(routeName);
}

class RouteActionPop extends RouteAction {
  ///Replace it with the package action which is used in the app
  ///Beamer: reader(beamerDelegateProvider)?.beamBack();
  ///Auto route: reader(appRouterProvider)?.pop();
  @override
  void execute(Reader reader) => reader(beamerDelegateProvider)?.beamBack();
}

class RouteActionPushReplacementNamed extends RouteAction {
  RouteActionPushReplacementNamed(super.routeName);

  ///Replace it with the package action which is used in the app
  ///Beamer: reader(beamerDelegateProvider)?.beamToReplacementNamed(routeName);
  ///Auto route: reader(appRouterProvider)?.pushNamed(routeName);
  @override
  void execute(Reader reader) => reader(beamerDelegateProvider)?.beamToReplacementNamed(routeName);
}
