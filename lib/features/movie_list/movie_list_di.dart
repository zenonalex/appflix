import '../../di.dart';
import 'domain/usecases/get_popular_movies_usecase.dart';
import 'domain/usecases/get_top_rated_movies_usecase.dart';

Future<void> initMovieList() async {
  // Domain
  sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
}