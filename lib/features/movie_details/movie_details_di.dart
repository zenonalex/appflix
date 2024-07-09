import '../../di.dart';
import 'data/data_sources/movie_details_data_source.dart';
import 'data/repositories/movie_details_repository.dart';
import 'domain/repositories/i_movie_details_repository.dart';
import 'domain/usecases/get_movie_details_usecase.dart';
import 'presentation/bloc/movie_details_bloc.dart';

Future<void> initMovieDetails() async {
  // Data
  sl.registerLazySingleton<IMovieDetailsDataSource>(() => MovieDetailsDataSource(sl()));

  // Domain
  sl.registerLazySingleton<IMovieDetailsRepository>(() => MovieDetailsRepository(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));

  // Presentation
  sl.registerFactory(() => MovieDetailsBloc(sl()));
}
