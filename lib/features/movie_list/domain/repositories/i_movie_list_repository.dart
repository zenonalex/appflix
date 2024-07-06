import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie_list.dart';

abstract class IMovieListRepository {
  Future<Either<Failure,MovieList>> getPopularMovies();
  Future<Either<Failure,MovieList>> getTopRatedMovies();
}
