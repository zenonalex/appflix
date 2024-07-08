part of 'movie_list_bloc.dart';

sealed class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class GetMovieListEvent extends MovieListEvent {
  final MovieListType type;
  final String? term;

  const GetMovieListEvent({
    this.type = MovieListType.popular,
    this.term,
  });
}
