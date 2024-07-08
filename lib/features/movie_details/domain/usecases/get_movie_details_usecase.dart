import 'package:dartz/dartz.dart';

import '../../../../commons/entities/movie.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/i_movie_details_repository.dart';

class GetMovieDetailsUsecase {
  final IMovieDetailsRepository repository;

  GetMovieDetailsUsecase(this.repository);

  Future<Either<Failure, Movie>> call({required int movieId}) async {
    return await repository.getMovieDetails(movieId);
  }
}
