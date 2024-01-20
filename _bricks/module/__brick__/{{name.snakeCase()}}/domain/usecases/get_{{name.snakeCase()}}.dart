import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/{{name.snakeCase()}}.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

class Get{{name.pascalCase()}}UseCase {
  final {{name.pascalCase()}}Repository _repository;

  Get{{name.pascalCase()}}UseCase(this._repository);

  Future<Either<Failure, List<{{name.pascalCase()}}Entity>>> call() async {
    return _repository.get{{name.pascalCase()}}();
  }
}
