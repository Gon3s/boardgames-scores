import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/player_repository_impl.dart';
import '../repositories/player_repository.dart';

final PlayerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return PlayerRepositoryImpl();
});
