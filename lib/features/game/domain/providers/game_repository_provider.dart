import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/game_repository_impl.dart';
import '../repositories/game_repository.dart';

final gameRepositoryProvider = Provider<GameRepository>((ref) {
  return GameRepositoryImpl();
});
