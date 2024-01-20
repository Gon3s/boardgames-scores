import 'package:boardgames_scores/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/default.dart';
import '../repositories/default_repository.dart';

class GetDefaultUseCase {
  final DefaultRepository _repository;

  GetDefaultUseCase(this._repository);

  Future<Either<Failure, List<DefaultEntity>>> call() async {
    return _repository.getDefault();
  }
}
