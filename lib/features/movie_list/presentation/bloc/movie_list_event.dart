part of 'movie_list_bloc.dart';

sealed class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class GetMovieListEvent extends MovieListEvent {
  final MovieListType type;

  const GetMovieListEvent({required this.type});
}

class GetMovieListThisWeekEvent extends MovieListEvent {
  final MovieListType type;

  const GetMovieListThisWeekEvent({required this.type});
}
