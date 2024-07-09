import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commons/entities/movie.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_onGetMovieDetailsEvent);
  }

  Future<void> _onGetMovieDetailsEvent(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(status: MovieDetailsStatus.loading));

    final result = await getMovieDetailsUsecase(movieId: event.movieId);

    result.fold(
      (failure) => emit(state.copyWith(status: MovieDetailsStatus.failure)),
      (movie) {
        emit(state.copyWith(movie: movie, status: MovieDetailsStatus.success));
      },
    );
  }
}
