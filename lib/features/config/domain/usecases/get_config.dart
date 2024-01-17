import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/config.dart';
import '../repositories/config_repository.dart';

class GetConfigUseCase {
  final ConfigRepository _repository;

  GetConfigUseCase(this._repository);

  Future<Either<Failure, ConfigEntity>> call() async {
    return _repository.getConfig();
  }
}
