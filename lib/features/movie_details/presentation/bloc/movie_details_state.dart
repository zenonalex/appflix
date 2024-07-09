part of 'movie_details_bloc.dart';

enum MovieDetailsStatus { loading, success, failure }

enum MovieCreditsStatus { loading, success, failure }

final class MovieDetailsState extends Equatable {
  final Movie? movie;
  final Cast? cast;
  final MovieDetailsStatus detailsStatus;
  final MovieCreditsStatus creditsStatus;

  const MovieDetailsState({
    this.detailsStatus = MovieDetailsStatus.loading,
    this.cast,
    this.movie,
    this.creditsStatus = MovieCreditsStatus.loading,
  });

  MovieDetailsState copyWith({
    Movie? movie,
    MovieDetailsStatus? detailsStatus,
    Cast? cast,
    MovieCreditsStatus? creditsStatus,
  }) {
    return MovieDetailsState(
        detailsStatus: detailsStatus ?? this.detailsStatus,
        movie: movie ?? this.movie,
        cast: cast ?? this.cast,
        creditsStatus: creditsStatus ?? this.creditsStatus);
  }

  @override
  List<Object?> get props => [
        detailsStatus,
        movie,
        cast,
        creditsStatus,
      ];
}
