import 'package:dartz/dartz.dart';
import 'package:poc_generic_app/core/error/exception.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/config.dart';
import '../../domain/repositories/config_repository.dart';
import '../data_sources/local_data_source.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  final LocalDataSource localDataSource;

  ConfigRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, ConfigEntity>> getConfig() async {
    try {
      final config = await localDataSource.getConfig();
      return Right(config);
    } on ServerExeption {
      return const Left(ServerFailure('An error has occured'));
    }
  }
}
