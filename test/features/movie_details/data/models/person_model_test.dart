import 'dart:convert';

import 'package:appflix/features/movie_details/data/models/person_model.dart';
import 'package:appflix/features/movie_details/domain/entities/person.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  late Person entity;
  late PersonModel model;

  setUp(() {
    entity = const Person(
      profilePath: "/rwmvRonpluV6dCPiQissYrchvSD.jpg",
      name: 'Amy Poehler',
      character: 'Joy (voice)',
      knownForDepartment: 'Acting',
    );
    model = const PersonModel(
      profilePath: "/rwmvRonpluV6dCPiQissYrchvSD.jpg",
      name: 'Amy Poehler',
      character: 'Joy (voice)',
      knownForDepartment: 'Acting',
    );
  });

  group('entity and model convertions', () {
    test('should convert entity to model', () async {
      //Arrange
      //Act
      var result = PersonModel.fromEntity(entity);
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
      var json = fixture('person.json');
      //Act
      var result = PersonModel.fromJson(jsonDecode(json));
      //Assert
      expect(result, model);
    });
  });
}
