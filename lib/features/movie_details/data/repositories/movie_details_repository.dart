import 'package:dartz/dartz.dart';

import '../../../../commons/entities/movie.dart';
import '../../../../commons/models/movie_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/cast.dart';
import '../../domain/repositories/i_movie_details_repository.dart';
import '../data_sources/movie_details_data_source.dart';
import '../models/cast_model.dart';

class MovieDetailsRepository implements IMovieDetailsRepository {
  final IMovieDetailsDataSource dataSource;

  MovieDetailsRepository(this.dataSource);

  @override
  Future<Either<Failure, Movie>> getMovieDetails(int movieId) async {
    try {
      final result = await dataSource.getMovieDetails(movieId);

      return Right(result.toEntity());
    } on NetworkException {
      return const Left(NetworkFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Cast>> getMovieCredits(int movieId) async {
    try {
      final result = await dataSource.getMovieCredits(movieId);

      return Right(result.toEntity());
    } on NetworkException {
      return const Left(NetworkFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
