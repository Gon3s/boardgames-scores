import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/config.dart';

abstract class ConfigRepository {
  Future<Either<Failure, ConfigEntity>> getConfig();
}
