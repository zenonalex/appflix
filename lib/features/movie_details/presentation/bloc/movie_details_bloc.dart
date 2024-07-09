import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commons/entities/movie.dart';
import '../../domain/entities/cast.dart';
import '../../domain/usecases/get_movie_credits_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieCreditsUsecase getMovieCreditsUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getMovieCreditsUsecase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_onGetMovieDetailsEvent);
    on<GetMovieCreditsEvent>(_onGetMovieCreditsEvent);
  }

  Future<void> _onGetMovieDetailsEvent(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(detailsStatus: MovieDetailsStatus.loading));

    final result = await getMovieDetailsUsecase(movieId: event.movieId);

    result.fold(
      (failure) => emit(state.copyWith(detailsStatus: MovieDetailsStatus.failure)),
      (movie) {
        emit(state.copyWith(movie: movie, detailsStatus: MovieDetailsStatus.success));
      },
    );
  }

  Future<void> _onGetMovieCreditsEvent(GetMovieCreditsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(creditsStatus: MovieCreditsStatus.loading));

    final result = await getMovieCreditsUsecase(movieId: event.movieId);

    result.fold(
      (failure) => emit(state.copyWith(creditsStatus: MovieCreditsStatus.failure)),
      (cast) {
        emit(state.copyWith(cast: cast, creditsStatus: MovieCreditsStatus.success));
      },
    );
  }
}
