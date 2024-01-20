import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/{{name.snakeCase()}}.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, List<{{name.pascalCase()}}Entity>>> get{{name.pascalCase()}}();
}
