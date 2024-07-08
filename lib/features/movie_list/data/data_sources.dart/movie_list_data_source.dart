import 'dart:convert';
import 'dart:io';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/http_client/http_client.dart';
import '../../utils/movie_list_type.dart';
import '../models/movie_list_model.dart';

abstract class IMovieListDataSource {
  Future<MovieListModel> getMovieList(MovieListType type, int page, String? query);
}

class MovieListDataSource implements IMovieListDataSource {
  final IHttpClient client;

  MovieListDataSource(this.client);

  @override
  Future<MovieListModel> getMovieList(MovieListType type, int page, String? query) async {
    final response = await client.get(
      type.endpoint,
      queryParameters: {
        "page": page.toString(),
        "query": query,
      },
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseJson = jsonDecode(response.body);
        return MovieListModel.fromJson(responseJson);
      default:
        throw const ServerException();
    }
  }
}
