part of 'movie_list_bloc.dart';

enum MovieListStatus { loading, success, empty, failure }

final class MovieListState extends Equatable {
  final List<Movie> movies;
  final MovieListStatus status;
  final MovieListType movieListType;
  final String? searchTerm;
  final int page;
  final int totalPages;
  final int totalResults;

  const MovieListState({
    this.status = MovieListStatus.loading,
    this.movies = const <Movie>[],
    this.movieListType = MovieListType.popular,
    this.searchTerm,
    this.page = 0,
    this.totalPages = 0,
    this.totalResults = 0,
  });

  MovieListState copyWith({
    List<Movie>? movies,
    MovieListStatus? status,
    MovieListType? movieListType,
    String? searchTerm,
    int? page,
    int? totalPages,
    int? totalResults,
  }) {
    return MovieListState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      movieListType: movieListType ?? this.movieListType,
      searchTerm: searchTerm ?? this.searchTerm,
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
        searchTerm,
        page,
        totalPages,
        totalResults,
      ];
}
