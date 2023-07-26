import 'package:auto_route/auto_route.dart';
import 'package:oruphones/core/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: SearchRoute.page)
  ];
}
