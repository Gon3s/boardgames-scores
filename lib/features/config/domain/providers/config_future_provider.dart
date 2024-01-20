import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/config.dart';
import '../usecases/get_config.dart';

final getConfigFutureProvider = FutureProvider<ConfigEntity>(
  (ref) => ref.read(getCategoryUsecaseProvider).call().then(
        (value) => value.fold(
          (failure) => throw failure,
          (config) => config,
        ),
      ),
);
