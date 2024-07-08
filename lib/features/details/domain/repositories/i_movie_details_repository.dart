import 'package:dartz/dartz.dart';

import '../../../../commons/entities/movie.dart';
import '../../../../core/errors/failures.dart';

abstract class IMovieDetailsRepository {
  Future<Either<Failure, Movie>> getMovieDetails(int movieId);
}
