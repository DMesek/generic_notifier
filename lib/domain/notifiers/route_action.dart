import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/common/domain/router/beamer_delegate_provider.dart';

abstract class RouteAction {
  final String routeName;

  RouteAction([this.routeName = '']);

  void execute(Reader reader);
}

///Replace it with the package action which is used in the app
///Beamer: reader(beamerDelegateProvider)?.beamToNamed(routeName);
///Auto route: reader(appRouterProvider)?.pushNamed(routeName);
class RouteActionPushNamed extends RouteAction {
  RouteActionPushNamed(super.routeName);

  @override
  void execute(Reader reader) =>
      reader(beamerDelegateProvider)?.beamToNamed(routeName);
}

///Replace it with the package action which is used in the app
///Beamer: reader(beamerDelegateProvider)?.beamBack();
///Auto route: reader(appRouterProvider)?.pop();
class RouteActionPop extends RouteAction {
  @override
  void execute(Reader reader) => reader(beamerDelegateProvider)?.beamBack();
}

class RouteActionPushReplacement extends RouteAction {
  RouteActionPushReplacement(super.routeName);

  ///Replace it with the package action which is used in the app
  ///Beamer: reader(beamerDelegateProvider)?.beamToReplacementNamed(routeName);
  ///Auto route: reader(appRouterProvider)?.pushNamed(routeName);
  @override
  void execute(Reader reader) =>
      reader(beamerDelegateProvider)?.beamToReplacementNamed(routeName);
}
