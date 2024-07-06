import 'package:appflix/core/errors/failures.dart';
import 'package:appflix/features/movie_list/domain/entities/movie_list.dart';
import 'package:appflix/features/movie_list/domain/repositories/i_movie_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUsecase {
  final IMovieListRepository repository;

  GetPopularMoviesUsecase(this.repository);

  Future<Either<Failure, MovieList>> call() async {
    return await repository.getPopularMovies();
  }
}
