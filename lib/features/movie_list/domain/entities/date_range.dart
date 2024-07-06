import 'package:equatable/equatable.dart';

class DateRange extends Equatable {
  final DateTime maximum;
  final DateTime minimum;

  const DateRange({
    required this.maximum,
    required this.minimum,
  });

  @override
  List<Object?> get props => [
        maximum,
        minimum,
      ];
}
