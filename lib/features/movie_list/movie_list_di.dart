import '../../di.dart';
import 'data/repositories/movie_list_repository.dart';
import 'domain/repositories/i_movie_list_repository.dart';
import 'domain/usecases/get_movie_list_usecase.dart';
import 'presentation/bloc/movie_list_bloc.dart';

Future<void> initMovieList() async {
  // Data
  sl.registerLazySingleton<IMovieListRepository>(() => MovieListRepository(sl()));

  // Domain
  sl.registerLazySingleton(() => GetMovieListUsecase(sl()));

  // Presentation
  sl.registerLazySingleton(() => MovieListBloc(sl()));
}