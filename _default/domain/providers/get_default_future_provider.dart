import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/default.dart';
import 'get_default_usecase_provider.dart';

final getDefaultFutureProvider = FutureProvider<List<DefaultEntity>>(
  (ref) => ref.read(getDefaultUsecaseProvider).call().then(
        (value) => value.fold(
          (failure) => throw failure,
          (default_) => default_,
        ),
      ),
);
