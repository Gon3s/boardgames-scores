import 'package:boardgames_scores/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/default.dart';
import '../../domain/repositories/default_repository.dart';
import '../models/default.dart';

class DefaultRepositoryImpl extends DefaultRepository {
  @override
  Future<Either<Failure, List<DefaultEntity>>> getDefault() async {
    await Future.delayed(const Duration(seconds: 2));

    return Right(
      DefaultModel.mockData().map((e) => e.toEntity()).toList(),
    );
  }
}
