import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/movie_list.dart';
import 'date_range_model.dart';
import '../../../../commons/models/movie_model.dart';

part 'movie_list_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieListModel extends Equatable {
  final DateRangeModel? dates;
  final int page;
  final List<MovieModel> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  const MovieListModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) => _$MovieListModelFromJson(json);

  static MovieListModel fromEntity(MovieList entity) => MovieListModel(
        dates: entity.dates == null ? null : DateRangeModel.fromEntity(entity.dates!),
        page: entity.page,
        results: entity.results.map((e) => MovieModel.fromEntity(e)).toList(),
        totalPages: entity.totalPages,
        totalResults: entity.totalResults,
      );

  @override
  List<Object?> get props => [
        dates,
        page,
        results,
        totalPages,
        totalResults,
      ];
}

extension MovieListModelExtension on MovieListModel {
  MovieList toEntity() => MovieList(
        dates: dates?.toEntity(),
        page: page,
        results: results.map((e) => e.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );
}
