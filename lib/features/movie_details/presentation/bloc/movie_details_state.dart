part of 'movie_details_bloc.dart';

enum MovieDetailsStatus { loading, success, failure }

final class MovieDetailsState extends Equatable {
  final Movie? movie;
  final MovieDetailsStatus status;

  const MovieDetailsState({
    this.status = MovieDetailsStatus.loading,
    this.movie,
  });

  MovieDetailsState copyWith({
    Movie? movie,
    MovieDetailsStatus? status,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movie,
      ];
}
