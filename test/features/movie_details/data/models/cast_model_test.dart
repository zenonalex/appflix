import 'dart:convert';

import 'package:appflix/features/movie_details/data/models/cast_model.dart';
import 'package:appflix/features/movie_details/data/models/person_model.dart';
import 'package:appflix/features/movie_details/domain/entities/cast.dart';
import 'package:appflix/features/movie_details/domain/entities/person.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  late Cast entity;
  late CastModel model;

  setUp(() {
    entity = const Cast(
      cast: [
        Person(
          profilePath: "/rwmvRonpluV6dCPiQissYrchvSD.jpg",
          name: 'Amy Poehler',
          character: 'Joy (voice)',
          knownForDepartment: 'Acting',
        ),
        Person(
          profilePath: "/zv9RlbPcG5Xle1LUp0Q7vyHrPK2.jpg",
          name: 'Maya Hawke',
          character: 'Anxiety (voice)',
          knownForDepartment: 'Acting',
        ),
      ],
    );
    model = const CastModel(
      cast: [
        PersonModel(
          profilePath: "/rwmvRonpluV6dCPiQissYrchvSD.jpg",
          name: 'Amy Poehler',
          character: 'Joy (voice)',
          knownForDepartment: 'Acting',
        ),
        PersonModel(
          profilePath: "/zv9RlbPcG5Xle1LUp0Q7vyHrPK2.jpg",
          name: 'Maya Hawke',
          character: 'Anxiety (voice)',
          knownForDepartment: 'Acting',
        ),
      ],
    );
  });

  group('entity and model convertions', () {
    test('should convert entity to model', () async {
      //Arrange
      //Act
      var result = CastModel.fromEntity(entity);
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
      var json = fixture('cast.json');
      //Act
      var result = CastModel.fromJson(jsonDecode(json));
      //Assert
      expect(result, model);
    });
  });
}
