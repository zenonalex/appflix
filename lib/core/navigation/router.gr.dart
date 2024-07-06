// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appflix/features/movie_list/presentation/screen/movie_list_screen.dart'
    as _i1;
import 'package:auto_route/auto_route.dart' as _i2;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MovieListRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MovieListScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.MovieListScreen]
class MovieListRoute extends _i2.PageRouteInfo<void> {
  const MovieListRoute({List<_i2.PageRouteInfo>? children})
      : super(
          MovieListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieListRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
