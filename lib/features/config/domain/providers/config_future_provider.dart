import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/config.dart';
import 'config_repository_provider.dart';

final configFutureProvider = FutureProvider.autoDispose<ConfigEntity>((ref) async {
  final repository = ref.watch(configRepositoryProvider);
  final result = await repository.getConfig();
  return result.fold(
    (failure) => throw failure,
    (config) => config,
  );
});
