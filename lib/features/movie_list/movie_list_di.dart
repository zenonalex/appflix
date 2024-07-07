import '../../di.dart';
import 'domain/usecases/get_movie_list_usecase.dart';
import 'presentation/bloc/movie_list_bloc.dart';

Future<void> initMovieList() async {
  // Domain
  sl.registerLazySingleton(() => GetMovieListUsecase(sl()));

  // Presentation
  sl.registerLazySingleton(() => MovieListBloc(sl()));
}