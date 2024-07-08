import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_list_usecase.dart';
import '../../utils/movie_list_type.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetMovieListUsecase getMovieListUsecase;

  MovieListBloc(this.getMovieListUsecase) : super(const MovieListState()) {
    on<GetMovieListEvent>(_onGetMovieListEvent, transformer: droppable());
  }

  Future<void> _onGetMovieListEvent(GetMovieListEvent event, Emitter<MovieListState> emit) async {
    emit(state.copyWith(status: MovieListStatus.loading));

    if (event.type != state.movieListType || event.term != null) {
      emit(
        state.copyWith(
          movieListType: event.type,
          movies: [],
          page: 0,
          totalPages: 0,
          totalResults: 0,
        ),
      );
    }

    final result = await getMovieListUsecase(type: event.type, page: state.page + 1, query: event.term);

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
