import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
class CustomException with _$CustomException implements Exception {
  const factory CustomException.networkException() = NetworkException;
  const factory CustomException.serverException() = ServerException;
  const factory CustomException.loadFileException() = LoadFileException;
  const factory CustomException.storageException() = StorageException;
  const factory CustomException.unauthorizedException() = UnauthorizedException;
  const factory CustomException.badRequestException() = BadRequestException;
  const factory CustomException.typeConvertionException() = TypeConvertionException;
  const factory CustomException.notFoundException() = NotFoundException;
  const factory CustomException.conflictException() = ConflictException;
}

class PropertyUnavailableException implements Exception {
  final List<dynamic> listings;
  PropertyUnavailableException(this.listings);
}
