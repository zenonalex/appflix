part of 'movie_list_bloc.dart';

sealed class MovieListEvent {
  const MovieListEvent();
}

class GetMovieListEvent extends MovieListEvent {
  final MovieListType type;
  final String? term;

  const GetMovieListEvent({
    this.type = MovieListType.popular,
    this.term,
  });
}

class ResetSearchListEvent extends MovieListEvent {}
