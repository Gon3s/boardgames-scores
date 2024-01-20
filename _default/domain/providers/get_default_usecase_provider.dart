import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecases/get_default.dart';
import 'default_repository_provider.dart';

final getDefaultUsecaseProvider = Provider<GetDefaultUseCase>((ref) => GetDefaultUseCase(ref.read(defaultRepositoryProvider)));
