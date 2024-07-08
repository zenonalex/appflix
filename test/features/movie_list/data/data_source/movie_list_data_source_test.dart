import 'dart:convert';
import 'dart:io';

import 'package:appflix/core/errors/exceptions.dart';
import 'package:appflix/core/http_client/http_client.dart';
import 'package:appflix/features/movie_list/data/data_sources.dart/movie_list_data_source.dart';
import 'package:appflix/features/movie_list/data/models/movie_list_model.dart';
import 'package:appflix/features/movie_list/utils/movie_list_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient client;
  late IMovieListDataSource dataSource;

  setUp(() {
    client = MockHttpClient();
    dataSource = MovieListDataSource(client);
  });

  group('[MovieListDataSource] - ', () {
    test('getMovieList - should return a MovieListModel when the client returns 200', () async {
      //Arrange
      when(() => client.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(fixture('movie_list.json'), HttpStatus.ok));
      //Act
      final result = await dataSource.getMovieList(MovieListType.popular, 1, null);
      //Assert
      expect(result, MovieListModel.fromJson(json.decode(fixture('movie_list.json'))));
    });

    test('getMovieList - should throw a ServerException when the client returns other than 200', () async {
      //Arrange
      when(() => client.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response('', HttpStatus.serviceUnavailable));
      //Act
      //Assert
      expect(() => dataSource.getMovieList(MovieListType.popular, 1, null), throwsA(const ServerException()));
    });
  });
}
