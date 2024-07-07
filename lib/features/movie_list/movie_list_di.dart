import '../../di.dart';
import 'domain/usecases/get_movie_list_usecase.dart';

Future<void> initMovieList() async {
  // Domain
  sl.registerLazySingleton(() => GetMovieListUsecase(sl()));
}