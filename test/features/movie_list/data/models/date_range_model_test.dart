import 'dart:convert';

import 'package:appflix/features/movie_list/data/models/date_range_model.dart';
import 'package:appflix/features/movie_list/domain/entities/date_range.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  late DateRange entity;
  late DateRangeModel model;

  setUp(() {
    entity = DateRange(
      maximum: DateTime.parse("2023-05-03"),
      minimum: DateTime.parse("2023-03-16"),
    );
    model = DateRangeModel(
      maximum: DateTime.parse("2023-05-03"),
      minimum: DateTime.parse("2023-03-16"),
    );
  });

  group('entity and model convertions', () {
    test('should convert entity to model', () async {
      //Arrange
      //Act
      var result = DateRangeModel.fromEntity(entity);
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
      var json = fixture('date_range.json');
      //Act
      var result = DateRangeModel.fromJson(jsonDecode(json));
      //Assert
      expect(result, model);
    });
  });
}
