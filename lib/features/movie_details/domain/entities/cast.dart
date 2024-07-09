import 'package:equatable/equatable.dart';

import 'person.dart';

class Cast extends Equatable {
  final List<Person> cast;

  const Cast({required this.cast});

  @override
  List<Object?> get props => [cast];
}
