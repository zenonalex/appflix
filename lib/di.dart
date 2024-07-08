import 'package:get_it/get_it.dart';

import 'core/core_di.dart';
import 'features/movie_details/movie_details_di.dart';
import 'features/movie_list/movie_list_di.dart';

final sl = GetIt.instance;

Future<void> init() async {
  initCore();
  initMovieList();
  initMovieDetails();
}
