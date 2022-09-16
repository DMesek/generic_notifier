// ignore_for_file: always_use_package_imports

import 'base_router.dart';

abstract class RouteAction {
  final String routeName;

  RouteAction([this.routeName = '']);

  void execute(BaseRouter baseRouter);
}

class PushNamedAction extends RouteAction {
  PushNamedAction(super.routeName);

  @override
  void execute(BaseRouter baseRouter) => baseRouter.pushNamed(routeName);
}

class PopAction extends RouteAction {
  @override
  void execute(BaseRouter baseRouter) => baseRouter.pop();
}

class PushReplacementNamedAction extends RouteAction {
  PushReplacementNamedAction(super.routeName);

  @override
  void execute(BaseRouter baseRouter) =>
      baseRouter.pushReplacementNamed(routeName);
}
