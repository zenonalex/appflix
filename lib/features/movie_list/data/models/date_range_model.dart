import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/date_range.dart';

part 'date_range_model.g.dart';

@JsonSerializable(createToJson: false)
class DateRangeModel extends Equatable {
  final DateTime maximum;
  final DateTime minimum;

  const DateRangeModel({
    required this.maximum,
    required this.minimum,
  });

  factory DateRangeModel.fromJson(Map<String, dynamic> json) => _$DateRangeModelFromJson(json);

  static DateRangeModel fromEntity(DateRange entity) => DateRangeModel(
        maximum: entity.maximum,
        minimum: entity.minimum,
      );

  @override
  List<Object?> get props => [
        maximum,
        minimum,
      ];
}

extension DateRangeModelExtension on DateRangeModel {
  DateRange toEntity() => DateRange(
        maximum: maximum,
        minimum: minimum,
      );
}
