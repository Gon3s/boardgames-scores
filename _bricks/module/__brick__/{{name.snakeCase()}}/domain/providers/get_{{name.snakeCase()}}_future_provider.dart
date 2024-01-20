import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/{{name.snakeCase()}}.dart';
import 'get_{{name.snakeCase()}}_usecase_provider.dart';

final get{{name.pascalCase()}}FutureProvider = FutureProvider<List<{{name.pascalCase()}}Entity>>(
  (ref) => ref.read(get{{name.pascalCase()}}UsecaseProvider).call().then(
        (value) => value.fold(
          (failure) => throw failure,
          ({{name.camelCase()}}) => {{name.camelCase()}},
        ),
      ),
);
