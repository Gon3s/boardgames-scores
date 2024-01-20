import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

final {{name.pascalCase()}}RepositoryProvider = Provider<{{name.pascalCase()}}Repository>((ref) {
  return {{name.pascalCase()}}RepositoryImpl();
});
