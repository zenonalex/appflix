import 'dart:convert';
import 'dart:io';

import '../../../../commons/models/movie_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/http_client/http_client.dart';
import '../models/cast_model.dart';

abstract class IMovieDetailsDataSource {
  Future<MovieModel> getMovieDetails(int movieId);
  Future<CastModel> getMovieCredits(int movieId);
}

class MovieDetailsDataSource implements IMovieDetailsDataSource {
  final IHttpClient client;

  MovieDetailsDataSource(this.client);

  @override
  Future<MovieModel> getMovieDetails(int movieId) async {
    const detailsHost = "3/movie/";
    final response = await client.get(detailsHost + movieId.toString());

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseJson = jsonDecode(response.body);
        return MovieModel.fromJson(responseJson);
      default:
        throw const ServerException();
    }
  }

  @override
  Future<CastModel> getMovieCredits(int movieId) async {
    final detailsHost = "3/movie/$movieId/credits";
    final response = await client.get(detailsHost);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseJson = jsonDecode(response.body);
        return CastModel.fromJson(responseJson);
      default:
        throw const ServerException();
    }
  }
}
