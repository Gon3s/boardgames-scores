import 'package:boardgames_scores/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/default.dart';

abstract class DefaultRepository {
  Future<Either<Failure, List<DefaultEntity>>> getDefault();
}
