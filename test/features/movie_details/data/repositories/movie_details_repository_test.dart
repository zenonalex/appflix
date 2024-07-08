import 'dart:convert';

import 'package:appflix/commons/entities/movie.dart';
import 'package:appflix/commons/models/movie_model.dart';
import 'package:appflix/core/errors/exceptions.dart';
import 'package:appflix/core/errors/failures.dart';
import 'package:appflix/features/movie_details/data/data_sources/movie_details_data_source.dart';
import 'package:appflix/features/movie_details/data/repositories/movie_details_repository.dart';
import 'package:appflix/features/movie_details/domain/repositories/i_movie_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockMovieDetailsDataSource extends Mock implements IMovieDetailsDataSource {}

void main() {
  late IMovieDetailsRepository repository;
  late IMovieDetailsDataSource dataSource;
  late Movie movie;
  late MovieModel movieModel;

  setUp(() {
    dataSource = MockMovieDetailsDataSource();
    repository = MovieDetailsRepository(dataSource);
    movieModel = MovieModel.fromJson(jsonDecode(fixture('movie.json')));
    movie = movieModel.toEntity();
  });

  group("[MovieDetilsRepository] ", () {
    test("should returns Right when datasource was called correctly.", () async {
      //Arrange
      when(() => dataSource.getMovieDetails(any())).thenAnswer((_) async => movieModel);
      //Act
      final result = await repository.getMovieDetails(832);
      //Assert
      expect(result, Right(movie));
      verify(() => dataSource.getMovieDetails(832));
      verifyNoMoreInteractions(dataSource);
    });

    test("should return a Left(NetworkFailure) when the datasource throws a NetworkException.", () async {
      //Arrange
      when(() => dataSource.getMovieDetails(any())).thenThrow(const NetworkException());
      //Act
      final result = await repository.getMovieDetails(832);
      //Assert
      expect(result, const Left(NetworkFailure()));
      verify(() => dataSource.getMovieDetails(832));
      verifyNoMoreInteractions(dataSource);
    });

    test("should return a Left(ServerFailure) when the datasource throws a ServerException.", () async {
      //Arrange
      when(() => dataSource.getMovieDetails(any())).thenThrow(const ServerException());
      //Act
      final result = await repository.getMovieDetails(832);
      //Assert
      expect(result, const Left(ServerFailure()));
      verify(() => dataSource.getMovieDetails(832));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
