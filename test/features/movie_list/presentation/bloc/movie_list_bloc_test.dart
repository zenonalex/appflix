import 'dart:convert';

import 'package:appflix/core/errors/failures.dart';
import 'package:appflix/features/movie_list/data/models/movie_list_model.dart';
import 'package:appflix/features/movie_list/domain/entities/movie_list.dart';
import 'package:appflix/features/movie_list/domain/usecases/get_movie_list_usecase.dart';
import 'package:appflix/features/movie_list/presentation/bloc/movie_list_bloc.dart';
import 'package:appflix/features/movie_list/utils/movie_list_type.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockGetMovieListUsecase extends Mock implements GetMovieListUsecase {}

void main() {
  late MovieListBloc bloc;
  late GetMovieListUsecase usecase;
  late MovieList movieList;
  late MovieListModel movieListModel;

  setUpAll(() {
    registerFallbackValue(MovieListType.popular);
  });

  setUp(() {
    usecase = MockGetMovieListUsecase();
    bloc = MovieListBloc(usecase);
    movieListModel = MovieListModel.fromJson(jsonDecode(fixture('movie_list.json')));
    movieList = movieListModel.toEntity();
  });

  group('[GetMovieListEvent] - ', () {
    blocTest(
      'should emit [MovieListState.loading, MovieListState.failure]'
      ' when [GetMovieListEvent] return a [Left]',
      setUp: () {
        when(() => usecase(type: any(named: 'type'), page: any(named: 'page')))
            .thenAnswer((_) async => const Left(ServerFailure()));
      },
      build: () => bloc,
      act: (MovieListBloc bloc) => bloc.add(const GetMovieListEvent(type: MovieListType.popular)),
      expect: () => [
        const MovieListState(status: MovieListStatus.loading),
        const MovieListState(status: MovieListStatus.failure),
      ],
    );

    blocTest(
      'should emit [MovieListState.loading, MovieListState.success]'
      ' when [GetMovieListEvent] return a [Left]',
      setUp: () {
        when(() => usecase(type: any(named: 'type'), page: any(named: 'page')))
            .thenAnswer((_) async => Right(movieList));
      },
      build: () => bloc,
      act: (MovieListBloc bloc) => bloc.add(const GetMovieListEvent(type: MovieListType.popular)),
      expect: () => [
        const MovieListState(status: MovieListStatus.loading),
        MovieListState(
          status: MovieListStatus.success,
          movies: movieList.results,
          page: movieList.page,
          totalPages: movieList.totalPages,
          totalResults: movieList.totalResults,
        ),
      ],
    );

    blocTest(
      'should emit [MovieListState.loading, MovieListState.success]'
      ' when [GetMovieListEvent] return a [Left]',
      setUp: () {
        when(() => usecase(type: any(named: 'type'), page: any(named: 'page'), query: any(named: 'query')))
            .thenAnswer((_) async => Right(movieList));
      },
      build: () => bloc,
      act: (MovieListBloc bloc) => bloc.add(const GetMovieListEvent(type: MovieListType.popular, term: 'Teste')),
      expect: () => [
        const MovieListState(status: MovieListStatus.loading),
        MovieListState(
          status: MovieListStatus.success,
          movies: movieList.results,
          page: movieList.page,
          totalPages: movieList.totalPages,
          totalResults: movieList.totalResults,
          searchTerm: "Teste",
        ),
      ],
    );
  });

  group("[ResetSearchListEvent] - ", () {
    blocTest(
      'should emit [MovieListState.loading, MovieListState.success]'
      ' when [GetMovieListEvent] return a [Left]',
      setUp: () {
        when(() => usecase(type: any(named: 'type'), page: any(named: 'page')))
            .thenAnswer((_) async => Right(movieList));
      },
      build: () => bloc,
      act: (MovieListBloc bloc) => bloc.add(ResetSearchListEvent()),
      expect: () => [
        const MovieListState(
          movieListType: MovieListType.popular,
          movies: [],
          page: 0,
          totalPages: 0,
          totalResults: 0,
          searchTerm: null,
        ),
        MovieListState(
          status: MovieListStatus.success,
          movies: movieList.results,
          page: movieList.page,
          totalPages: movieList.totalPages,
          totalResults: movieList.totalResults,
        ),
      ],
    );
  });
}
