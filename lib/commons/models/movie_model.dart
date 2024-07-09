import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieModel extends Equatable {
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  final int id;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_title")
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date", readValue: _checkObjectValue)
  final DateTime? releaseDate;
  final String title;
  final bool video;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;

  const MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  static MovieModel fromEntity(Movie entity) => MovieModel(
        adult: entity.adult,
        backdropPath: entity.backdropPath,
        genreIds: entity.genreIds,
        id: entity.id,
        originalLanguage: entity.originalLanguage,
        originalTitle: entity.originalTitle,
        overview: entity.overview,
        popularity: entity.popularity,
        posterPath: entity.posterPath,
        releaseDate: entity.releaseDate,
        title: entity.title,
        video: entity.video,
        voteAverage: entity.voteAverage,
        voteCount: entity.voteCount,
      );

  static Object? _checkObjectValue(Map map, String key) {
    return map[key] == '' || map[key] == null ? null : map[key];
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}

extension MovieModelExtension on MovieModel {
  Movie toEntity() => Movie(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}
