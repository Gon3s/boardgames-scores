import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/game.dart';
import 'get_games_usecase_provider.dart';

final getGamesFutureProvider = FutureProvider<List<GameEntity>>(
  (ref) => ref.read(getGamesUsecaseProvider).call().then(
        (value) => value.fold(
          (failure) => throw failure,
          (games) => games,
        ),
      ),
);
