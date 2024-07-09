import 'dart:convert';

import 'package:appflix/commons/entities/movie.dart';
import 'package:appflix/commons/models/movie_model.dart';
import 'package:appflix/core/errors/failures.dart';
import 'package:appflix/features/movie_details/domain/usecases/get_movie_details_usecase.dart';
import 'package:appflix/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockGetMovieDetailsUsecase extends Mock implements GetMovieDetailsUsecase {}

void main() {
  late MovieDetailsBloc bloc;
  late GetMovieDetailsUsecase usecase;
  late Movie movie;
  late MovieModel movieModel;

  setUp(() {
    usecase = MockGetMovieDetailsUsecase();
    bloc = MovieDetailsBloc(usecase);
    movieModel = MovieModel.fromJson(jsonDecode(fixture('movie.json')));
    movie = movieModel.toEntity();
  });

  group('[GetMovieDetailsEvent] - ', () {
    blocTest(
      'should emit [MovieState.loading, MovieState.failure]'
      ' when [GetMovieDetailsEvent] return a [Left]',
      setUp: () {
        when(() => usecase(movieId: any(named: 'movieId')))
            .thenAnswer((_) async => const Left(ServerFailure()));
      },
      build: () => bloc,
      act: (MovieDetailsBloc bloc) => bloc.add(const GetMovieDetailsEvent(movieId:640146 )),
      expect: () => [
        const MovieDetailsState(status: MovieDetailsStatus.loading),
        const MovieDetailsState(status: MovieDetailsStatus.failure),
      ],
    );

    blocTest(
      'should emit [MovieState.loading, MovieState.success]'
      ' when [GetMovieDetailsEvent] return a [Left]',
      setUp: () {
        when(() => usecase(movieId: any(named: 'movieId')))
            .thenAnswer((_) async => Right(movie));
      },
      build: () => bloc,
      act: (MovieDetailsBloc bloc) => bloc.add(const GetMovieDetailsEvent(movieId:640146)),
      expect: () => [
        const MovieDetailsState(status: MovieDetailsStatus.loading),
        MovieDetailsState(
          status: MovieDetailsStatus.success,
          movie: movie
        ),
      ],
    );
  });
}
