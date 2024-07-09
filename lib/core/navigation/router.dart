import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MovieListRoute.page, initial: true),
        AutoRoute(page: MovieDetailsRoute.page),
      ];
}
