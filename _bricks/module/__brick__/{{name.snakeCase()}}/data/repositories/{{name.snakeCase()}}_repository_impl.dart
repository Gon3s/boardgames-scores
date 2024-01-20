import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../models/{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository {
  @override
  Future<Either<Failure, List<{{name.pascalCase()}}Entity>>> get{{name.pascalCase()}}() async {
    // Simulate a delay to show the loading indicator
    await Future.delayed(const Duration(seconds: 2));

    return Right(
      {{name.pascalCase()}}Model.mockData().map((e) => e.toEntity()).toList(),
    );
  }
}
