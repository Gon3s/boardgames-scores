import 'package:dartz/dartz.dart';
import 'package:poc_generic_app/core/error/failure.dart';
import 'package:poc_generic_app/features/config/domain/entities/config.dart';

import '../repositories/config_repository.dart';

class GetConfigUseCase {
  final ConfigRepository _repository;

  GetConfigUseCase(this._repository);

  Future<Either<Failure, ConfigEntity>> call() async {
    return _repository.getConfig();
  }
}
