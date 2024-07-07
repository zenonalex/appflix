import 'dart:convert';

import 'package:appflix/core/errors/exceptions.dart';
import 'package:appflix/core/errors/failures.dart';
import 'package:appflix/features/movie_list/data/data_sources.dart/movie_list_data_source.dart';
import 'package:appflix/features/movie_list/data/models/movie_list_model.dart';
import 'package:appflix/features/movie_list/data/repositories/movie_list_repository.dart';
import 'package:appflix/features/movie_list/domain/entities/movie_list.dart';
import 'package:appflix/features/movie_list/domain/repositories/i_movie_list_repository.dart';
import 'package:appflix/features/movie_list/utils/movie_list_type.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockMovieListDataSource extends Mock implements IMovieListDataSource {}

void main() {
  late IMovieListRepository repository;
  late IMovieListDataSource dataSource;
  late MovieList movieList;
  late MovieListModel movieListModel;

  setUp(() {
    dataSource = MockMovieListDataSource();
    repository = MovieListRepository(dataSource);
    movieListModel = MovieListModel.fromJson(jsonDecode(fixture('movie_list.json')));
    movieList = movieListModel.toEntity();
  });

  setUpAll(() {
    registerFallbackValue(MovieListType.popular);
  });

  group("[MovieListRepository] ", () {
    test("should returns Right when datasource was called correctly.", () async {
      //Arrange
      when(() => dataSource.getMovieList(any(), any())).thenAnswer((_) async => movieListModel);
      //Act
      final result = await repository.getMovieList(MovieListType.popular, 1);
      //Assert
      expect(result, Right(movieList));
      verify(() => dataSource.getMovieList(MovieListType.popular, 1));
      verifyNoMoreInteractions(dataSource);
    });

    test("should return a Left(NetworkFailure) when the datasource throws a NetworkException.", () async {
      //Arrange
      when(() => dataSource.getMovieList(any(), any())).thenThrow(const NetworkException());
      //Act
      final result = await repository.getMovieList(MovieListType.popular, 1);
      //Assert
      expect(result, const Left(NetworkFailure()));
      verify(() => dataSource.getMovieList(MovieListType.popular, 1));
      verifyNoMoreInteractions(dataSource);
    });

    test("should return a Left(ServerFailure) when the datasource throws a ServerException.", () async {
      //Arrange
      when(() => dataSource.getMovieList(any(), any())).thenThrow(const ServerException());
      //Act
      final result = await repository.getMovieList(MovieListType.popular, 1);
      //Assert
      expect(result, const Left(ServerFailure()));
      verify(() => dataSource.getMovieList(MovieListType.popular, 1));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
