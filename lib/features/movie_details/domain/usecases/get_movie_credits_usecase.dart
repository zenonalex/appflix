import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cast.dart';
import '../repositories/i_movie_details_repository.dart';

class GetMovieCreditsUsecase {
  final IMovieDetailsRepository repository;

  GetMovieCreditsUsecase(this.repository);

  Future<Either<Failure, Cast>> call({required int movieId}) async {
    return await repository.getMovieCredits(movieId);
  }
}
