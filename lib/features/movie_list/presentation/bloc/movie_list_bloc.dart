import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_list_usecase.dart';
import '../../utils/movie_list_type.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetMovieListUsecase getMovieListUsecase;

  MovieListBloc(this.getMovieListUsecase) : super(const MovieListState()) {
    on<GetMovieListEvent>(_onGetMovieListEvent);
  }

  Future<void> _onGetMovieListEvent(GetMovieListEvent event, Emitter<MovieListState> emit) async {
    emit(state.copyWith(status: MovieListStatus.loading));

    final result = await getMovieListUsecase(type: event.type, page: state.page + 1);

    result.fold(
      (failure) => emit(state.copyWith(status: MovieListStatus.failure)),
      (movieList) => emit(
        state.copyWith(
          status: MovieListStatus.success,
          movies: List.of(state.movies)..addAll(movieList.results),
          movieListType: event.type,
          page: movieList.page,
          totalPages: movieList.totalPages,
          totalResults: movieList.totalResults,
        ),
      ),
    );
  }

}
