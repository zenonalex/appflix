import '../../di.dart';
import 'data/data_sources.dart/movie_list_data_source.dart';
import 'data/repositories/movie_list_repository.dart';
import 'domain/repositories/i_movie_list_repository.dart';
import 'domain/usecases/get_movie_list_usecase.dart';
import 'presentation/bloc/movie_list_bloc.dart';

Future<void> initMovieList() async {
  // Data
  sl.registerLazySingleton<IMovieListDataSource>(() => MovieListDataSource(sl()));

  // Domain
  sl.registerLazySingleton<IMovieListRepository>(() => MovieListRepository(sl()));
  sl.registerLazySingleton(() => GetMovieListUsecase(sl()));

  // Presentation
  sl.registerLazySingleton(() => MovieListBloc(sl()));
}