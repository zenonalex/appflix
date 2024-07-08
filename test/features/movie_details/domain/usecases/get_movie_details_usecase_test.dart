import 'dart:convert';

import 'package:appflix/commons/entities/movie.dart';
import 'package:appflix/commons/models/movie_model.dart';
import 'package:appflix/features/movie_details/domain/repositories/i_movie_details_repository.dart';
import 'package:appflix/features/movie_details/domain/usecases/get_movie_details_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockMovieDetailsRepository extends Mock implements IMovieDetailsRepository {}

void main() {
  late GetMovieDetailsUsecase usecase;
  late IMovieDetailsRepository repository;
  late Movie movie;

  setUp(() {
    repository = MockMovieDetailsRepository();
    usecase = GetMovieDetailsUsecase(repository);
    movie = MovieModel.fromJson(jsonDecode(fixture('movie.json'))).toEntity();
  });

  test('[GetMovieUsecase] - should correctly call the repository when the usecase is called', () async {
    //Arrange
    when(() => repository.getMovieDetails(any())).thenAnswer((_) async => Right(movie));
    //Act
    await usecase(movieId: 832);
    //Assert
    verify(() => repository.getMovieDetails(832));
    verifyNoMoreInteractions(repository);
  });
}
