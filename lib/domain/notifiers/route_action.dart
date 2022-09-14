import 'package:reusability/common/domain/router/base_router.dart';

abstract class RouteAction {
  final String routeName;

  RouteAction([this.routeName = '']);

  void execute(BaseRouter baseRouter);
}

class RouteActionPushNamed extends RouteAction {
  RouteActionPushNamed(super.routeName);

  @override
  void execute(BaseRouter baseRouter) => baseRouter.pushNamed(routeName);
}

class RouteActionPop extends RouteAction {
  @override
  void execute(BaseRouter baseRouter) => baseRouter.pop();
}

class RouteActionPushReplacementNamed extends RouteAction {
  RouteActionPushReplacementNamed(super.routeName);

  @override
  void execute(BaseRouter baseRouter) => baseRouter.pushReplacementNamed(routeName);
}
