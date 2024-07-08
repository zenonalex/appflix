import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../utils/movie_list_type.dart';
import '../entities/movie_list.dart';
import '../repositories/i_movie_list_repository.dart';

class GetMovieListUsecase {
  final IMovieListRepository repository;

  GetMovieListUsecase(this.repository);

  Future<Either<Failure, MovieList>> call({
    required MovieListType type,
    required int page,
    String? query,
  }) async {
    return await repository.getMovieList(type, page, query);
  }
}
