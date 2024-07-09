// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastModel _$CastModelFromJson(Map<String, dynamic> json) => CastModel(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
