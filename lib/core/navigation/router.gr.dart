// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appflix/features/movie_details/presentation/screens/movie_details_screen.dart'
    as _i1;
import 'package:appflix/features/movie_list/presentation/screen/movie_list_screen.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MovieDetailsScreen(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    MovieListRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MovieListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.MovieDetailsScreen]
class MovieDetailsRoute extends _i3.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i4.Key? key,
    required int movieId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movieId: movieId,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static const _i3.PageInfo<MovieDetailsRouteArgs> page =
      _i3.PageInfo<MovieDetailsRouteArgs>(name);
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movieId,
  });

  final _i4.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i2.MovieListScreen]
class MovieListRoute extends _i3.PageRouteInfo<void> {
  const MovieListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MovieListRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieListRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
