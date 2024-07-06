import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie_list.dart';
import '../repositories/i_movie_list_repository.dart';

class GetPopularMoviesUsecase {
  final IMovieListRepository repository;

  GetPopularMoviesUsecase(this.repository);

  Future<Either<Failure, MovieList>> call() async {
    return await repository.getPopularMovies();
  }
}
