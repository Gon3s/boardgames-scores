import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/game.dart';
import '../../domain/providers/get_games_usecase_provider.dart';

class GamesNotifier extends AutoDisposeAsyncNotifier<List<GameEntity>> {
  @override
  FutureOr<List<GameEntity>> build() async {
    final res = await ref.watch(getGamesUsecaseProvider).call();
    return res.fold((l) => [], (r) => r);
  }
}

final gamesNotifierProvider = AsyncNotifierProvider.autoDispose<GamesNotifier, List<GameEntity>>(GamesNotifier.new);
