import 'dart:convert';

import 'package:appflix/features/movie_list/data/models/movie_list_model.dart';
import 'package:appflix/features/movie_list/domain/entities/movie_list.dart';
import 'package:appflix/features/movie_list/domain/repositories/i_movie_list_repository.dart';
import 'package:appflix/features/movie_list/domain/usecases/get_movie_list_usecase.dart';
import 'package:appflix/features/movie_list/utils/movie_list_type.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockMovieListRepository extends Mock implements IMovieListRepository {}

void main() {
  late GetMovieListUsecase usecase;
  late IMovieListRepository repository;
  late MovieList movieList;

  setUp(() {
    repository = MockMovieListRepository();
    usecase = GetMovieListUsecase(repository);
    movieList = MovieListModel.fromJson(jsonDecode(fixture('movie_list.json'))).toEntity();
  });

  setUpAll(() {
    registerFallbackValue(MovieListType.popular);
  });

  test('[GetMovieListUsecase] - should correctly call the repository when the usecase is called', () async {
    //Arrange
    when(() => repository.getMovieList(any(), any())).thenAnswer((_) async => Right(movieList));
    //Act
    await usecase(type: MovieListType.popular, page: 1);
    //Assert
    verify(() => repository.getMovieList(MovieListType.popular, 1));
    verifyNoMoreInteractions(repository);
  });
}
