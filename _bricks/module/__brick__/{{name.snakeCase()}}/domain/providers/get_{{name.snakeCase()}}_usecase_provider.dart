import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecases/get_{{name.snakeCase()}}.dart';
import '{{name.snakeCase()}}_repository_provider.dart';

final get{{name.pascalCase()}}UsecaseProvider = Provider<Get{{name.pascalCase()}}UseCase>((ref) => Get{{name.pascalCase()}}UseCase(ref.read({{name.pascalCase()}}RepositoryProvider)));
