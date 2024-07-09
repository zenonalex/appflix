import 'dart:convert';
import 'dart:io';

import 'package:appflix/commons/models/movie_model.dart';
import 'package:appflix/core/errors/exceptions.dart';
import 'package:appflix/core/http_client/http_client.dart';
import 'package:appflix/features/movie_details/data/data_sources/movie_details_data_source.dart';
import 'package:appflix/features/movie_details/data/models/cast_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient client;
  late IMovieDetailsDataSource dataSource;

  setUp(() {
    client = MockHttpClient();
    dataSource = MovieDetailsDataSource(client);
  });

  group('[getMovieDetails] - ', () {
    test('should return a MovieListModel when the client returns 200', () async {
      //Arrange
      when(() => client.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(fixture('movie.json'), HttpStatus.ok));
      //Act
      final result = await dataSource.getMovieDetails(832);
      //Assert
      expect(result, MovieModel.fromJson(json.decode(fixture('movie.json'))));
    });

    test('should throw a ServerException when the client returns other than 200', () async {
      //Arrange
      when(() => client.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response('', HttpStatus.serviceUnavailable));
      //Act
      //Assert
      expect(() => dataSource.getMovieDetails(832), throwsA(const ServerException()));
    });
  });

  group('[getMovieCredits] - ', () {
    test('should return a MovieListModel when the client returns 200', () async {
      //Arrange
      when(() => client.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(fixture('cast.json'), HttpStatus.ok));
      //Act
      final result = await dataSource.getMovieCredits(832);
      //Assert
      expect(result, CastModel.fromJson(json.decode(fixture('cast.json'))));
    });

    test('should throw a ServerException when the client returns other than 200', () async {
      //Arrange
      when(() => client.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response('', HttpStatus.serviceUnavailable));
      //Act
      //Assert
      expect(() => dataSource.getMovieCredits(832), throwsA(const ServerException()));
    });
  });
}
