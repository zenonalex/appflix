import 'dart:convert';

import 'package:appflix/features/movie_details/data/models/cast_model.dart';
import 'package:appflix/features/movie_details/domain/entities/cast.dart';
import 'package:appflix/features/movie_details/domain/repositories/i_movie_details_repository.dart';
import 'package:appflix/features/movie_details/domain/usecases/get_movie_credits_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockMovieDetailsRepository extends Mock implements IMovieDetailsRepository {}

void main() {
  late GetMovieCreditsUsecase usecase;
  late IMovieDetailsRepository repository;
  late Cast cast;

  setUp(() {
    repository = MockMovieDetailsRepository();
    usecase = GetMovieCreditsUsecase(repository);
    cast = CastModel.fromJson(jsonDecode(fixture('cast.json'))).toEntity();
  });

  test('[GetMovieCreditsUsecase] - should correctly call the repository when the usecase is called', () async {
    //Arrange
    when(() => repository.getMovieCredits(any())).thenAnswer((_) async => Right(cast));
    //Act
    await usecase(movieId: 832);
    //Assert
    verify(() => repository.getMovieCredits(832));
    verifyNoMoreInteractions(repository);
  });
}
