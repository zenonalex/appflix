import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie_list.dart';
import '../repositories/i_movie_list_repository.dart';

class GetTopRatedMoviesUsecase {
  final IMovieListRepository repository;

  GetTopRatedMoviesUsecase(this.repository);

  Future<Either<Failure, MovieList>> call() async {
    return await repository.getTopRatedMovies();
  }
}
