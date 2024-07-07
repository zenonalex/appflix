import 'package:equatable/equatable.dart';

import 'date_range.dart';
import 'movie.dart';

class MovieList extends Equatable {
  final DateRange? dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const MovieList({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [
        dates,
        page,
        results,
        totalPages,
        totalResults,
      ];
}
