import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String? profilePath;
  final String name;
  final String character;
  final String knownForDepartment;

  const Person({
    required this.profilePath,
    required this.name,
    required this.character,
    required this.knownForDepartment,
  });

  @override
  List<Object?> get props => [
        profilePath,
        name,
        character,
        knownForDepartment,
      ];
}
