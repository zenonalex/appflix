import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/movie_list.dart';
import '../../domain/repositories/i_movie_list_repository.dart';
import '../../utils/movie_list_type.dart';
import '../data_sources.dart/movie_list_data_source.dart';
import '../models/movie_list_model.dart';

class MovieListRepository implements IMovieListRepository {
  final IMovieListDataSource dataSource;

  MovieListRepository(this.dataSource);

  @override
  Future<Either<Failure, MovieList>> getMovieList(MovieListType type, int page, String? query) async {
    try {
      final result = await dataSource.getMovieList(type, page, query);

      return Right(result.toEntity());
    } on NetworkException {
      return const Left(NetworkFailure());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
