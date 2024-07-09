import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cast.dart';
import 'person_model.dart';

part 'cast_model.g.dart';

@JsonSerializable(createToJson: false)
class CastModel extends Equatable {
  final List<PersonModel> cast;

  const CastModel({required this.cast});

  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);

  static CastModel fromEntity(Cast entity) => CastModel(
        cast: entity.cast.map((e) => PersonModel.fromEntity(e)).toList(),
      );

  @override
  List<Object?> get props => [cast];
}

extension CastModelExtension on CastModel {
  Cast toEntity() => Cast(
        cast: cast.map((e) => e.toEntity()).toList(),
      );
}
