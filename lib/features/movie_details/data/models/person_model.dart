import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/person.dart';

part 'person_model.g.dart';

@JsonSerializable(createToJson: false)
class PersonModel extends Equatable {
  @JsonKey(name: "profile_path")
  final String profilePath;
  final String name;
  final String character;
  @JsonKey(name: "known_for_department")
  final String knownForDepartment;

  const PersonModel({
    required this.profilePath,
    required this.name,
    required this.character,
    required this.knownForDepartment,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => _$PersonModelFromJson(json);

  static PersonModel fromEntity(Person entity) => PersonModel(
        profilePath: entity.profilePath,
        name: entity.name,
        character: entity.character,
        knownForDepartment: entity.knownForDepartment,
      );

  @override
  List<Object?> get props => [
        profilePath,
        name,
        character,
        knownForDepartment,
      ];
}

extension PersonModelExtension on PersonModel {
  Person toEntity() => Person(
        profilePath: profilePath,
        name: name,
        character: character,
        knownForDepartment: knownForDepartment,
      );
}
