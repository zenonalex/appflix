import 'dart:convert';

import 'package:appflix/features/movie_list/data/models/movie_list_model.dart';
import 'package:appflix/commons/models/movie_model.dart';
import 'package:appflix/commons/entities/movie.dart';
import 'package:appflix/features/movie_list/domain/entities/movie_list.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  late MovieList entity;
  late MovieListModel model;

  setUp(() {
    entity = MovieList(
      dates:null,
      results: [
        Movie(
          adult: false,
          backdropPath: "/gMJngTNfaqCSCqGD4y8lVMZXKDn.jpg",
          genreIds: const [
            28,
            12,
            878,
          ],
          id: 640146,
          originalLanguage: "en",
          originalTitle: "Ant-Man and the Wasp: Quantumania",
          overview:
              "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
          popularity: 8567.865,
          posterPath: "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
          releaseDate: DateTime.parse("2023-02-15"),
          title: "Ant-Man and the Wasp: Quantumania",
          video: false,
          voteAverage: 6.5,
          voteCount: 1886,
        )
      ],
      page: 1,
      totalPages: 38029,
      totalResults: 760569,
    );
    model = MovieListModel(
      dates: null,
      results: [
        MovieModel(
          adult: false,
          backdropPath: "/gMJngTNfaqCSCqGD4y8lVMZXKDn.jpg",
          genreIds: const [
            28,
            12,
            878,
          ],
          id: 640146,
          originalLanguage: "en",
          originalTitle: "Ant-Man and the Wasp: Quantumania",
          overview:
              "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
          popularity: 8567.865,
          posterPath: "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
          releaseDate: DateTime.parse("2023-02-15"),
          title: "Ant-Man and the Wasp: Quantumania",
          video: false,
          voteAverage: 6.5,
          voteCount: 1886,
        )
      ],
      page: 1,
      totalPages: 38029,
      totalResults: 760569,
    );
  });

  group('entity and model convertions', () {
    test('should convert entity to model', () async {
      //Arrange
      //Act
      var result = MovieListModel.fromEntity(entity);
      //Assert
      expect(result, model);
    });

    test('should convert from model to entity', () async {
      //Arrange
      //Act
      var result = model.toEntity();
      //Assert
      expect(result, entity);
    });
  });

  group('Json convertions', () {
    test('should convert from json to model', () async {
      //Arrange
      var json = fixture('movie_list.json');
      //Act
      var result = MovieListModel.fromJson(jsonDecode(json));
      //Assert
      expect(result, model);
    });
  });
}
