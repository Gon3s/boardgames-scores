import 'package:dartz/dartz.dart';
import 'package:poc_generic_app/features/config/domain/entities/config.dart';

import '../../../../core/error/failure.dart';

abstract class ConfigRepository {
  Future<Either<Failure, ConfigEntity>> getConfig();
}
