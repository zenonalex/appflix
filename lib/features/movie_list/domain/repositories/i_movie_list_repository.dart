import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../utils/movie_list_type.dart';
import '../entities/movie_list.dart';

abstract class IMovieListRepository {
  Future<Either<Failure, MovieList>> getMovieList(MovieListType type, int page, String? query);
}
