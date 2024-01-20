import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../entities/config.dart';
import '../providers/config_repository_provider.dart';
import '../repositories/config_repository.dart';

final getCategoryUsecaseProvider = Provider<GetConfigUseCase>((ref) => GetConfigUseCase(ref.read(configRepositoryProvider)));

class GetConfigUseCase {
  final ConfigRepository _repository;

  GetConfigUseCase(this._repository);

  Future<Either<Failure, ConfigEntity>> call() async {
    return _repository.getConfig();
  }
}
