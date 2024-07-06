import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.networkFailure() = NetworkFailure;
  const factory Failure.serverFailure() = ServerFailure;
  const factory Failure.socketFailure() = SocketFailure;
  const factory Failure.fileSystemFailure() = FileSystemFailure;
  const factory Failure.loadFileFailure() = LoadFileFailure;
  const factory Failure.storageFailure() = StorageFailure;
  const factory Failure.unauthorizedFailure() = UnauthorizedFailure;
  const factory Failure.badRequestFailure() = BadRequestFailure;
  const factory Failure.typeConvertionFailure() = TypeConvertionFailure;
  const factory Failure.notFoundFailure() = NotFoundFailure;
  const factory Failure.conflictFailure() = ConflictFailure;
  const factory Failure.paramEmpty(String message) = ParamEmpty;
}

class PropertyUnavailableFailure extends Failure {
  final List<dynamic> listings;
  const PropertyUnavailableFailure._(this.listings) : super._();
  factory PropertyUnavailableFailure.withRecomendations(List<dynamic> listings) =>
      PropertyUnavailableFailure._(listings);
}
