import 'package:appflix/core/errors/failures.dart';
import 'package:appflix/features/movie_list/domain/entities/movie_list.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieListRepository {
  Future<Either<Failure,MovieList>> getPopularMovies();
  Future<Either<Failure,MovieList>> getTopRatedMovies();
}
