part of 'movie_list_bloc.dart';

enum MovieListStatus { loading, success, failure }

final class MovieListState extends Equatable {
  final List<Movie> movies;
  final MovieListStatus status;
  final MovieListType movieListType;
  final int page;
  final int totalPages;
  final int totalResults;

  const MovieListState({
    this.status = MovieListStatus.loading,
    this.movies = const <Movie>[],
    this.movieListType = MovieListType.popular,
    this.page = 0,
    this.totalPages = 0,
    this.totalResults = 0,
  });

  MovieListState copyWith({
    List<Movie>? movies,
    MovieListStatus? status,
    MovieListType? movieListType,
    int? page,
    int? totalPages,
    int? totalResults,
  }) {
    return MovieListState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      movieListType: movieListType ?? this.movieListType,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movies,
        movieListType,
        page,
        totalPages,
        totalResults,
      ];
}
